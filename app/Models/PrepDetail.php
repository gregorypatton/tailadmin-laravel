<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * @property string $prep_type_id
 * @property string $prep_detail
 * @property int $id
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Product> $products
 * @property-read int|null $products_count
 *
 * @method static \Illuminate\Database\Eloquent\Builder|PrepDetail newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|PrepDetail newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|PrepDetail query()
 * @method static \Illuminate\Database\Eloquent\Builder|PrepDetail whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|PrepDetail wherePrepDetail($value)
 * @method static \Illuminate\Database\Eloquent\Builder|PrepDetail wherePrepTypeId($value)
 *
 * @mixin \Eloquent
 */
class PrepDetail extends Model
{
    use HasFactory;


    protected $incrimenting = true;

    public $timestamps = false;

    public function products(): HasMany
    {
        return $this->hasMany(Product::class);
    }
}
