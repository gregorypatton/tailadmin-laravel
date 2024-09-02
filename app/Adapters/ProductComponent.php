<?php

namespace App\Adapters;

use App\Enums\ChannelEnum;
use App\Enums\IDTypeEnum;

interface ProductComponent
{
    public function getSku(): string;

    public function getTitle(): string;

    public function getCount(): int;

    public function getId(): string;

    public function getIdType(): ?IDTypeEnum;

    public function isKit(): bool;

    public function isHideUpc(): bool;

    public function isActive(): bool;

    public function getChannel(): ?ChannelEnum;

    public function getGtin(): ?int;
}
