<?php

namespace App\States\Packlist;

use Spatie\ModelStates\Exceptions\InvalidConfig;
use Spatie\ModelStates\State;
use Spatie\ModelStates\StateConfig;
use App\States\Packlist\Draft;

abstract class PacklistState extends State
{
    /**
     * @return StateConfig
     * @throws InvalidConfig
     */
    public static function config(): StateConfig
    {
        return parent::config()
            ->default(Draft::class)
            ->allowAllTransitions();
    }
}
