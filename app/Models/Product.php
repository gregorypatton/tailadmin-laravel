<?php

namespace App\Models;

use App\Enums\IDTypeEnum;
use App\Enums\ChannelEnum;
use App\Entities\LabelEntity;
use Awcodes\Curator\Models\Media;
use Spatie\ModelStates\HasStates;
use App\Traits\CreatedByUpdatedBy;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Product extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'sku',
        'title',
        'id_type',
        'sellable_id',
        'catalog_id',
        'gtin',
        'fnsku',
        'brand_id',
        'prep_detail_id',
        'channel_id',
        'state',
        'image_id',
        'created_by',
        'updated_by',
        'default_template_id',
    ];

    protected function casts(): array
    {
        return [
            'id_type' => 'App\Enums\IDTypeEnum',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'deleted_at' => 'datetime',
        ];
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function channel()
    {
        return $this->belongsTo(Channel::class);
    }

    public function components()
    {
        return $this->hasMany(ProductComponent::class, 'product_id');
    }

    public function usedInProducts()
    {
        return $this->hasMany(ProductComponent::class, 'component_id');
    }

    public function instructions()
    {
        return $this->hasMany(Instruction::class);
    }

    public function printTemplates()
    {
        return $this->belongsToMany(
            PrintTemplate::class,
            'products_print_template'
        );
    }

    public function packlists()
    {
        return $this->belongsToMany(Packlist::class);
    }

    public function toLabelEntity(int $count)
    {
        return new LabelEntity(
            channel: ChannelEnum::Amazon,
            sku: $this->sku,
            count: $count,
            title: $this->title,
            sellableId: $this->sellable_id,
            gtin: $this->gtin,
            fnsku: $this->fnsku,
            brand: $this->brand,
            options: null,
            idType: IDTypeEnum::FNSKU,
            defaultLabelTemplate: null,
            prepDetailId: null,
            packlistId: null
        );
    }

    public function scopeActive($query)
    {
        return $query->where('active', true);
    }
}
