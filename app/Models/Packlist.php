<?php

namespace App\Models;

use App\Enums\ChannelEnum;
use Spatie\ModelStates\HasStates;
use App\States\Packlist\PacklistState;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Packlist extends Model
{
    use HasStates;
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'user_id',
        'state',
        'created_by',
        'updated_by',
        'channel_id',
    ];

    protected $dates = ['deleted_at', 'created_at', 'updated_at'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function channel()
    {
        return $this->belongsTo(Channel::class);
    }

    public function products()
    {
        return $this->belongsToMany(Product::class);
    }

    public function getContentsAttribute()
    {
        return json_decode(collect($this->contents ?? [])->toJson());
    }

    public function getUrlAttribute()
    {
        return route('packlist.show', $this);
    }

    public function getEditUrlAttribute()
    {
        // return PacklistResource::getUrl('edit', ['record' => $this]);
    }
}
