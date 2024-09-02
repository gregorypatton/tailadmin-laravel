<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ProductPrintTemplate extends Model
{
    use HasFactory;

    protected $table = 'products_print_template';

    public $timestamps = false;

    protected $guarded = [];
}
