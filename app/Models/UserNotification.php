<?php

namespace App\Models;

class UserNotification extends _BaseModel
{
    //关联的类型
    const RELATED_TYPE = ['未知类型' => 0, '文章' => 1, '会议' => 2, '留言' => 3];

    //操作的类型
    const OPERATE_TYPE = ['未知类型' => 0, '查看' => 1, '审核' => 2, '参加' => 3];

    protected $appends = ['related_type_format', 'operate_type_format'];

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function getRelatedTypeFormatAttribute()
    {
        return array_flip(self::RELATED_TYPE)[$this->related_type];
    }

    public function getOperateTypeFormatAttribute()
    {
        return array_flip(self::RELATED_TYPE)[$this->operate_type];
    }
}
