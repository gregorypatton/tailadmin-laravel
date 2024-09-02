<?php

namespace App\Classes;

use App\Entities\ProductEntity;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\View;

class LabelSheetGenerator
{
    public string $template;

    public Collection $productEntities;

    public bool $precise_count_output = true;

    public int $extra_labels = 0;

    public array $errors = [];

    public string $batchId;

    public int $labels_processed = 0;

    public string $result;

    public function __construct(string $batchId, Collection $productEntities)
    {
        $this->batchId = $batchId;
        $this->productEntities = $productEntities->filter(function (ProductEntity $productEntity) {
            if ($productEntity->getCount() > 0) {
                return true;
            } else {
                $this->errors[] = [
                    'sku' => $productEntity->getSku(),
                    'count' => $productEntity->getCount(),
                    'error_code' => 0,
                ];

                return false;
            }
        });

        $this->streamGenerate();
    }

    public function processedCount(): int
    {
        return $this->labels_processed;
    }

    public function exactCount(): self
    {
        $this->precise_count_output = true;

        return $this;
    }

    public function fullPagesOnly(): self
    {
        $this->precise_count_output = false;

        return $this;
    }

    public function withExtraLabels(int $count): self
    {
        $this->extra_labels = $count;
        $this->addExtraLabels();

        return $this;
    }

    private function addExtraLabels(): void
    {
        $this->productEntities = $this->productEntities->map(function (ProductEntity $productEntity) {
            // Clone the productEntity to avoid side effects
            $clonedProductEntity = clone $productEntity;
            $updatedCount = $clonedProductEntity->getCount() + $this->extra_labels;
            $clonedProductEntity->count = $updatedCount;

            return $clonedProductEntity;
        });
    }

    private function generatePages(): \Generator
    {
        $labels_per_page = 30;

        foreach ($this->productEntities as $productEntity) {
            $count = $productEntity->getCount();
            $fullPages = intdiv($count, $labels_per_page);
            $remainder = $count % $labels_per_page;

            for ($i = 0; $i < $fullPages; $i++) {
                yield array_fill(0, $labels_per_page, $productEntity);
            }

            if ($remainder > 0) {
                $page = array_fill(0, $remainder, $productEntity);
                $page = array_pad($page, $labels_per_page, null); // Fill remaining slots with null
                yield $page;
            }
        }
    }

    public function streamGenerate(): void
    {
        $result = '<html><head><title>'.$this->batchId.'</title><style media="screen" rel="stylesheet" type="text/css">html{  -ms-zoom:0.50;  -moz-transform:scale(0.5);  -moz-transform-origin:0 0;  -o-transform:scale(0.5);  -o-transform-origin:0 0;  -webkit-transform:scale(0.5);  -webkit-transform-origin:0 0; }</style><style media="print,screen" rel="stylesheet" type="text/css" >.instructions,.kit{position:absolute;font-size:.7em;padding:1.2px;border:1px dotted}.condition,.kit{float:left}a,abbr,acronym,address,applet,article,aside,audio,b,big,blockquote,body,canvas,caption,center,cite,code,dd,del,details,dfn,div,dl,dt,em,embed,fieldset,figcaption,figure,footer,form,h1,h2,h3,h4,h5,h6,header,hgroup,html,i,iframe,img,ins,kbd,label,legend,li,mark,menu,nav,object,ol,output,p,pre,q,ruby,s,samp,section,small,span,strike,strong,sub,summary,sup,table,tbody,td,tfoot,th,thead,time,tr,tt,u,ul,var,video{margin:0;padding:0;border:0;font-family:Roboto,sans-serif;font-optical-sizing:auto;font-weight:400;font-style:normal;vertical-align:baseline}.instructions,h1{font-family:"Roboto Condensed",sans-serif}h1{font-size:1.1em;font-weight:400}.kit{font-weight:600}.instructions{margin-top:-22px;font-weight:800}.blank-label,.label{-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box;width:2.625in;height:1in;padding:5px .3in 0;margin-right:.155in;margin-top:.04in;float:left;text-align:center;overflow:hidden}img{height:20px;width:100%}html{line-height:1}ol,ul{list-style:none}table{border-collapse:collapse;border-spacing:0}caption,td,th{text-align:left;font-weight:400;vertical-align:middle}blockquote,q{quotes:none}blockquote:after,blockquote:before,q:after,q:before{content:"";content:none}a img{border:none}article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section,summary{display:block}.page{width:8.5in;margin:0;margin-left:-.02in!important;margin-top:-7px!important;padding:.5in 0 0 .3in;font-family:arial;text-align:center;page-break-after:always}.f_right{font-size:.6em}.fnsku,.label h1{font-size:1em}.title{font-weight:500}.fnsku{font-weight:400}.condition,.tm{font-size:.8em;padding-top:2px}#barcode{max-width:100%;max-height:30px}.tm{float:right}.bottom{width:100%}</style>';
        $result .= '<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@100..900&display=swap" rel="stylesheet"></head><body>';

        foreach ($this->generatePages() as $page) {
            $result .= '<div class="page">';
            foreach ($page as $label_position => $product) {
                $this->labels_processed++;
                if ($product) {
                    $result .= View::make('labels.30up.label', compact('product', 'label_position'))->render();
                } else {
                    $result .= View::make('labels.30up.blank')->render();
                }
            }
            $result .= '</div>';
        }

        $this->result = $result.'</body></html>';
    }
}
