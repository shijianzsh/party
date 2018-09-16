<?php

namespace App\Models;

class MeetingUser extends _BaseModel
{
    const TYPE = ['未知类型' => 0, '参会领导' => 1, '参会人员' => 2];

    protected $fillable = ['user_id', 'type', 'need_appointment'];
}
