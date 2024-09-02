<?php

namespace App\Traits;

use Illuminate\Support\Str;

trait FillWithUuid
{
    public function initializeFillWithUuid()
    {
        $this->attributes['uuid'] = Str::orderedUuid();
    }
}
