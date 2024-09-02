<?php

namespace App\Models;

use App\Traits\FillWithUuid;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

/**
 * @property string $uuid
 * @property int $user_id
 * @property string $file_path
 * @property string $status
 * @property string|null $batch_id
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 *
 * @method static \Illuminate\Database\Eloquent\Builder|LabelSheet newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|LabelSheet newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|LabelSheet query()
 * @method static \Illuminate\Database\Eloquent\Builder|LabelSheet whereBatchId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|LabelSheet whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|LabelSheet whereFilePath($value)
 * @method static \Illuminate\Database\Eloquent\Builder|LabelSheet whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|LabelSheet whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|LabelSheet whereUserId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|LabelSheet whereUuid($value)
 *
 * @mixin \Eloquent
 */
class LabelSheet extends Model
{
    use FillWithUuid;

    public $incrementing = false;

    protected $keyType = 'string';

    public $timestamps = true;

    protected $fillable = [
        'user_id',
        'batch_id',
        'file_path',
        'status',
    ];

    public function __construct(array $attributes = [])
    {
        $attributes['uuid'] = Str::orderedUuid();
        parent::__construct($attributes);
    }
}
