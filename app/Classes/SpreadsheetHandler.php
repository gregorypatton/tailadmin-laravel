<?php

namespace App\Classes;

use App\Collections\ProductEntityCollection;
use App\Entities\ProductEntity;
use App\Enums\ChannelEnum;
use App\Enums\IDTypeEnum;
use Illuminate\Support\Collection;
use App\Models\Product;
use Illuminate\Support\Str;
use PhpOffice\PhpSpreadsheet\IOFactory;

class SpreadsheetHandler
{
    public $spreadsheet;

    public $rowCount = 0;

    public $emptyCount = 0;

    public $name;

    public ?Collection $collection;

    public ?string $currentId = '0';

    public $currentChannel = ChannelEnum::Unknown;

    public function __construct($file)
    {
        $this->spreadsheet = IOFactory::createReader('Xlsx')->setReadDataOnly(true)->load($file->getRealPath());
        $this->collection = collect([]);
        $this->name = Str::uuid()->toString();
    }

    public function readSpreadsheet(): void
    {
        $worksheet = $this->spreadsheet->getActiveSheet();
        $maxDataRow = $worksheet->getHighestDataRow();
        $this->rowCount = $maxDataRow;
        $rowIterator = $worksheet->getRowIterator(1, $maxDataRow);

        $startToggle = false;

        foreach ($rowIterator as $row) {
            if ($row->isEmpty()) {
                $this->emptyCount++;

                if ($this->emptyCount >= 2) {
                    $startToggle = false;
                    $this->currentChannel = ChannelEnum::Unknown;
                    $this->currentId = null;
                    $this->emptyCount = 0;
                }

                continue;
            }

            $this->emptyCount = 0;

            $columnIterator = $row->getCellIterator();
            $columnIterator->setIterateOnlyExistingCells(false);

            $localRow = [];
            foreach ($columnIterator as $cell) {
                $localRow[] = $cell->getValue();
            }

            if ($localRow[0] == 'SKU') {
                continue;
            }

            // Handle cases where $localRow[0] is not null
            if (! is_null($localRow[0])) {
                // Detect channel and ID rows
                if (in_array(strtoupper($localRow[0]), ['AMAZON', 'WALMART', 'SHOP'])) {
                    if (! empty($this->currentId)) {
                        $this->collection->push(new ProductEntityCollection($this->currentChannel, $this->currentId, []));
                    }

                    $startToggle = true;
                    $this->currentChannel = ChannelEnum::fromString($localRow[0]);
                    $this->currentId = $localRow[2];

                    continue;
                }

                // Process products if a packlist is active
                if ($startToggle) {
                    if ($this->currentChannel == ChannelEnum::Amazon) {
                        $product = Product::where('sku','=',$localRow[0])->first();
                        if (count($this->collection) == 0) {
                            $this->collection[0] = collect([]);
                        }
                        $this->collection->last()->push($product->toProductEntity((int)$localRow[1]));

                        continue;
                    }

                    if ($this->currentChannel == ChannelEnum::Walmart) {
                        if (count($this->collection) == 0) {
                            $this->collection[0] = collect([]);
                        }
                        $this->collection->last()->push(new ProductEntity(
                            channel: ChannelEnum::Walmart,
                            sku: $localRow[0],
                            count: $localRow[10],
                            title: $localRow[14],
                            id: $localRow[12],
                            gtin: $localRow[12],
                            fnsku: null,
                            brand: null,
                            idType: IDTypeEnum::UPC,
                            defaultLabelTemplate: null,
                            prepDetailId: null
                        ));

                        continue;
                    }
                }
            }
        }
    }
}
