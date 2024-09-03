<?php

namespace App\Adapters;

use App\Adapters\ProductComponent;
use App\Entities\LabelEntity;
use App\Enums\ChannelEnum;
use App\Enums\IDTypeEnum;
use Milon\Barcode\DNS1D;

class LabelEntityAdapter implements ProductComponent
{
    private LabelEntity $labelEntity;

    private int $count;
    public function __construct(LabelEntity $labelEntity, int $count)
    {
        $this->labelEntity = $labelEntity;
        $this->count = $count;
    }

    public function getsellableId(): string
    {
        return $this->labelEntity->sellableId;
    }

    public function getIdType(): IDTypeEnum
    {
        return $this->labelEntity->idType;
    }

    public function isKit(): bool
    {
        return $this->labelEntity->isKit();
    }

    public function isHideUpc(): bool
    {
        return $this->labelEntity->isHideUpc();
    }

    public function isActive(): bool
    {
        return $this->labelEntity->isActive();
    }

    public function getChannel(): ?ChannelEnum
    {
        return $this->labelEntity->channel;
    }

    public function getGtin(): ?int
    {
        if (! is_null($this->labelEntity->gtin)) {
            return $this->labelEntity->gtin;
        }
    }

    public function getSku(): string
    {
        return $this->labelEntity->sku;
    }

    public function getTitle(): string
    {
        return $this->labelEntity->title;
    }

    public function getCount(): int
    {
        return $this->count;
    }
    public function getBrand(): ?string
    {
        return $this->labelEntity->brand;
    }
    public function getFnsku(): ?string
    {
        return $this->labelEntity->fnsku;
    }
    public function barcode(?int $width, ?int $height): string
    {
        return '<img src="data:image/png;base64,' . (new DNS1D())->getBarcodePNG($this->labelEntity->sellableId, $this->labelEntity->idType->getBarcodeFormat(), $width, $height) . '" id="barcode"/>';
    }
    public function toArray(): array
    {
        return [
            'sku' => $this->getSku(),
            'title' => $this->getTitle(),
            'sellableId' => $this->getsellableId(),
            'gtin' => $this->getGtin(),
            'fnsku' => $this->getFnsku(),
            'brand' => $this->getBrand(),
            'idType' => $this->getIdType(),
            'count' => $this->count,
            'customMessage' => null,
            'isKit' => $this->isKit(),
            'isHideUpc' => $this->isHideUpc(),
            'isActive' => $this->isActive(),
            // Add any other relevant fields
        ];
    }
}
