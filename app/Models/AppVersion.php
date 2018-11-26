<?php

namespace App\Models;

class AppVersion extends _BaseModel
{
    public const TYPE = ['未知类型' => 0, 'windows' => 1,'macOS' => 2, 'android' => 3, 'iOS' => 4];
    protected $appends = [
        'type_format',
        'created_at_format',
        'updated_at_format',
    ];
    protected $casts = [
        'more' => 'json',
    ];

    public function getTypeFormatAttribute()
    {
        if (!in_array($this->type, self::TYPE)) return '数据错误';
        return array_flip(self::TYPE)[$this->type];
    }
}
