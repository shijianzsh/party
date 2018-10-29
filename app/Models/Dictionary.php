<?php

namespace App\Models;

/**
 * 字典表
 */
class Dictionary extends _BaseModel
{
    protected $casts = [
        'value' => 'json',
    ];
}
