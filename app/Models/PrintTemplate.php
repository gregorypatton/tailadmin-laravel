<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PrintTemplate extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'name',
        'avery_id',
        'labels_per_page',
        'user_id',
        'state',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $dates = ['created_at', 'updated_at', 'deleted_at'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function products()
    {
        return $this->belongsToMany(Product::class, 'products_print_template');
    }

    public function instructions()
    {
        return $this->belongsToMany(
            Instruction::class,
            'instructions_print_template'
        );
    }
}
