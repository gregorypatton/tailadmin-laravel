<?php

namespace App\Traits;

trait CreatedByUpdatedBy
{
    public static function bootCreatedByUpdatedBy()
    {
        // updating created_by and updated_by when model is created
        static::creating(function ($model) {
            if (!$model->isDirty('created_by')) {
                $model->created_by = 1;
            }
            if (!$model->isDirty('updated_by')) {
                $model->updated_by = 1;
            }
        });

        // updating updated_by when model is updated
        static::updating(function ($model) {
            if (!$model->isDirty('updated_by')) {
                $model->updated_by = 1;
            }
        });
    }
}
