<?php

namespace App\Models;

class ChatUserMessage extends _BaseModel
{
    protected $appends = [
        'created_at_format',
        'updated_at_format',
    ];

    const TYPE = ['未知类型' => 0, '文本' => 1];
}
