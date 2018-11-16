<?php

namespace App\Models;

class AppVersion extends _BaseModel
{
    protected $appends = [
        'created_at_format',
        'updated_at_format',
    ];
}
