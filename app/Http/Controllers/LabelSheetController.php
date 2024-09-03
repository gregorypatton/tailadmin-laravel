<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\View;
use App\Entities\LabelEntity;
use App\Enums\ChannelEnum;
use App\Enums\IDTypeEnum;
use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;

class LabelSheetController extends Controller
{
    protected $html = '<html>

<head>
      <link
        href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap"
        rel="stylesheet">
</head><body>';

    public function generateLabels(Request $request)
    {
        // Validate the incoming request
        $validated = $request->validate([
            'products' => 'required|array',
            'products.*.sku' => 'required|string|exists:products,sku',
            'products.*.count' => 'required|integer|min:1',
            'template' => 'required|string',
        ]);

        // Store the validated request in session to pass to the new window
        $request->session()->put('label_data', $validated);

        // Generate a URL that will be used to open the label sheet in a new window
        $url = route('label.renderSheet');

        // Use Inertia to redirect to the new window
        return Inertia::location($url);
    }

    public function renderLabelSheet()
    {
        // Get validated data
        $validated = session('label_data');
        $skus = collect($validated['products'])->pluck('sku');

        // Get all related models matching the sku
        $productsData = Product::whereIn('sku', $skus)->get();

        /** Map each to a LabelEntity interface.
        The LabelEntity interface helps to handle
        business logic in unimplemented areas. **/

        $labelEntities = $productsData->map(function ($product) use ($validated) {
            $brandName = $product->brand ? $product->brand : 'none';
            $productInput = collect($validated['products'])->firstWhere('sku', $product->sku); // Get the mirrored count value from the sku => count array

            return new LabelEntity(
                channel: ChannelEnum::Amazon,
                sku: $product->sku,
                count: $productInput['count'],
                title: $product->title,
                sellableId: $product->sellable_id,
                gtin: $product->gtin,
                fnsku: $product->fnsku,
                brand: $brandName,
                idType: $product->id_type,
                options: $product->options
            );
        });

        // Build the pages with the label entities
        $pages = $this->buildLabelData(30, $labelEntities);
        foreach ($pages as $page) {
            $this->html .= '<div class="page">';
            foreach ($page as $i => $entity) {
                $label =  (is_null($entity)) ? View::make('labels.label-30up.label', ['currentIndex' => $i, 'product' => $entity['label']])->render() :
                    View::make('labels.label-30up.blank')->render();
                $this->html .= $label;
            }
            $this->html .= '</div>';
        }
        return $this->html;
    }

    protected function buildLabelData(?int $labelsPerPage, $labelEntities)
    {
        ($labelsPerPage) ? $labelsPerPage : 30;

        $pages = [];
        $currentPage = [];
        $currentCount = 0;

        foreach ($labelEntities as $labelEntity) {
            $remainingLabels = $labelEntity->getCount();

            while ($remainingLabels > 0) {
                $availableSpace = $labelsPerPage - $currentCount;

                if ($remainingLabels <= $availableSpace) {
                    // Add the remaining labels to the current page
                    $currentPage[] = [
                        'label' => $labelEntity,
                        'count' => $remainingLabels,
                    ];
                    $currentCount += $remainingLabels;
                    $remainingLabels = 0;
                } else {
                    // Fill the current page and start a new one
                    $currentPage[] = [
                        'label' => $labelEntity,
                        'count' => $availableSpace,
                    ];
                    $remainingLabels -= $availableSpace;
                    $pages[] = $currentPage;
                    $currentPage = [];
                    $currentCount = 0;
                }

                if ($currentCount === $labelsPerPage) {
                    $pages[] = $currentPage;
                    $currentPage = [];
                    $currentCount = 0;
                }
            }
        }

        // Add any remaining labels or blanks to the final page
        if (!empty($currentPage)) {
            while ($currentCount < $labelsPerPage) {
                $currentPage[] = ['' => null];  // Insert nulls for the remaining blank labels
                $currentCount++;
            }
            $pages[] = $currentPage;
        }

        return $pages;
    }
}
