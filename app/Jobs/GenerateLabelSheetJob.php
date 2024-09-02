<?php

namespace App\Jobs;

use App\Classes\LabelSheetGenerator;
use App\Models\LabelSheet;
use Exception;
use Illuminate\Bus\Batchable;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Bus;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class GenerateLabelSheetJob implements ShouldQueue
{
    use Batchable, Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public static function dispatchInBatches(int $userId, Collection $productEntities, string $userBatchId, string $sheetId, string $filePath): void
    {
        // Retrieve chunk size from the config array
        $chunkSize = config('labels.chunk_size');

        // Split the product entities into chunks based on chunk size
        $chunks = $productEntities->chunk($chunkSize);

        // Dispatch each chunk as a separate job
        foreach ($chunks as $chunk) {
            Bus::batch([
                new GenerateLabelSheetJob($userId, $chunk, $userBatchId, sheetId: $sheetId, filePath: $filePath),
            ])->dispatch();
        }
    }

    public function __construct(
        protected int $userId,
        protected Collection $productEntities,
        protected string $userBatchId,
        public string $sheetId,
        public string $filePath
    ) {
        $this->sheetId = Str::uuid()->toString();
        $this->batchId = $this->sheetId;
        $this->filePath = storage_path(config('labels.storage_path').'/'.$this->batchId.'.html');
    }

    /**
     * Handle the job execution.
     *
     * @return void
     */
    public function handle()
    {
        try {
            $this->initializeFilePath();
            $labelSheetGenerator = $this->generateLabelSheet();
            $this->saveOutputToFile($labelSheetGenerator->result);
            $this->updateProgress($labelSheetGenerator->processedCount());
            $this->saveJobInfo($this->sheetId, $this->userBatchId);
        } catch (Exception $e) {
            $this->handleFailure($e);
        }
    }

    /**
     * Initialize the file path for saving the output.
     */
    private function initializeFilePath(): void
    {
        $this->filePath = storage_path(config('labels.storage_path').'/'.$this->sheetId.'.html');
        Log::info("Job started: Sheet ID: {$this->sheetId}, Batch ID: {$this->userBatchId}, Path: {$this->filePath}");
    }

    /**
     * Generate the label sheet using LabelSheetGenerator.
     */
    private function generateLabelSheet(): LabelSheetGenerator
    {
        return new LabelSheetGenerator($this->sheetId, $this->productEntities);
    }

    /**
     * Save the generated output to the specified file.
     */
    private function saveOutputToFile(string $output): void
    {
        file_put_contents($this->filePath, $output);
        Log::info("Output saved to {$this->filePath}");
    }

    /**
     * Update the progress in the cache.
     */
    private function updateProgress(int $processedLabels): void
    {
        Cache::increment("batch:{$this->userBatchId}:processed_labels", $processedLabels);
    }

    /**
     * Save job information to the database.
     */
    private function saveJobInfo(string $sheetId, string $userBatchId): void
    {
        try {
            LabelSheet::create([
                'user_id' => $this->userId,
                'sheet_id' => $sheetId,
                'batch_id' => $userBatchId,
                'file_path' => $this->filePath,
            ]);
        } catch (Exception $e) {
            throw new Exception('Failed to save job information: '.$e->getMessage());
        }
    }

    /**
     * Handle failure by rolling back changes and logging the error.
     */
    private function handleFailure(Exception $e): void
    {
        if (File::exists($this->filePath)) {
            File::delete($this->filePath);
        }
        Log::error("Job failed: Sheet ID: {$this->sheetId}, Error: {$e->getMessage()}");
        $this->fail($e);
    }
}
