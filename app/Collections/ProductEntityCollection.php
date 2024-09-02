<?php

namespace App\Collections;

use App\Enums\ChannelEnum;
use Illuminate\Support\Collection;

class ProductEntityCollection extends Collection
{
    public function __construct(
        public ChannelEnum $channel,
        public string $packlistId,
        array $items = []
    ) {
        parent::__construct($items);
    }
}
