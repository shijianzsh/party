<?php

namespace App\Models;

class AppVersion extends _BaseModel
{
    public const TYPE = ['未知类型' => 0, 'pc' => 1, 'android' => 2, 'ios' => 3];
    protected $appends = [
        'created_at_format',
        'updated_at_format',
    ];
    protected $casts = [
        'more' => 'json',
    ];
}
