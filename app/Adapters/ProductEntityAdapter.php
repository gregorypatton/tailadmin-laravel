<?php

namespace App\Adapters;

use App\Entities\ProductEntity;
use App\Enums\ChannelEnum;
use App\Enums\IDTypeEnum;

class ProductEntityAdapter implements ProductComponent
{
    private ProductEntity $productEntity;

    private int $count;

    public function __construct(ProductEntity $productEntity, int $count)
    {
        $this->productEntity = $productEntity;
        $this->count = $count;
    }

    public function getId(): string
    {
        return $this->productEntity->id;
    }

    public function getIdType(): IDTypeEnum
    {
        return $this->productEntity->idType;
    }

    public function isKit(): bool
    {
        return $this->productEntity->isKit();
    }

    public function isHideUpc(): bool
    {
        return $this->productEntity->isHideUpc();
    }

    public function isActive(): bool
    {
        return $this->productEntity->isActive();
    }

    public function getChannel(): ?ChannelEnum
    {
        return $this->productEntity->channel;
    }

    public function getGtin(): ?int
    {
        if (! is_null($this->productEntity->gtin)) {
            return $this->productEntity->gtin;
        }
    }

    public function getSku(): string
    {
        return $this->productEntity->sku;
    }

    public function getTitle(): string
    {
        return $this->productEntity->title;
    }

    public function getCount(): int
    {
        return $this->count;
    }
}
