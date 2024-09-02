<?php

namespace App\States\PrintTemplate;

use Spatie\ModelStates\State;
use Spatie\ModelStates\StateConfig;
use App\States\PrintTemplate\Invalid;
use App\States\PrintTemplate\Valid;
use App\States\PrintTemplate\Submitted;

abstract class PrintTemplateState extends State
{

    public static function config(): StateConfig
    {
        return parent::config()
            ->default(Submitted::class) // Set default state to Submitted
            ->allowTransition(Submitted::class, Valid::class)
            ->allowTransition(Submitted::class, Invalid::class)
            ->allowTransition(Invalid::class, Valid::class)
            ->allowTransition(Valid::class, Invalid::class);
    }
}
