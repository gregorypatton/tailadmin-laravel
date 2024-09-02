<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProductComponent extends Model
{
    protected $fillable = ['product_id', 'component_id', 'quantity'];

    public static function boot()
    {
        parent::boot();

        static::saving(function ($model) {
            $model->validateNoCircularDependency();
        });
    }

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

    public function component(): BelongsTo
    {
        return $this->belongsTo(Product::class, 'component_id');
    }

    public function validateNoCircularDependency()
    {
        if ($this->product_id == $this->component_id) {
            throw new \Exception('A product cannot be its own component.');
        }

        $parentProduct = Product::find($this->product_id);
        if ($this->isCircular($parentProduct, $this->component_id)) {
            throw new \Exception('Circular dependency detected.');
        }
    }

    private function isCircular($product, $componentId)
    {
        foreach ($product->components as $component) {
            if ($component->component_id == $componentId) {
                return true;
            }

            if ($this->isCircular($component->component, $componentId)) {
                return true;
            }
        }

        return false;
    }
}
