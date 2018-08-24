<?php

namespace App\Models;

class UploadFileLog extends _BaseModel
{
    const UPDATED_AT = null;

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
}
