<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Instruction extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function printTemplates()
    {
        return $this->belongsToMany(
            PrintTemplate::class,
            'instructions_print_template'
        );
    }
}
