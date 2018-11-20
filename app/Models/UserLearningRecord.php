<?php

namespace App\Models;

class UserLearningRecord extends _BaseModel
{
    protected const TYPE = ['未知类型' => 0, '图文' => 1, '视频' => 2, '直播' => 3];

    protected $appends = [
        'created_at_format',
        'updated_at_format',
        'type_format',
    ];

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function post()
    {
        return $this->belongsTo('App\Models\PortalPost', 'post_id');
    }

//    public function live()
//    {
//        return null;
//        //TODO 直播学习
//        return $this->belongsTo('App\Models\Live', 'live_id');
//    }

    public function getTypeFormatAttribute()
    {
        return array_flip(self::TYPE)[$this->type];
    }
}
