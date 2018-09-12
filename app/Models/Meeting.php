<?php

namespace App\Models;

class Meeting extends _BaseModel
{
    const TYPE = ['未知类型' => 0, '线下' => 1, '线上' => 2];

    protected $appends = ['type_format', 'attend_users_count'];

    public function audit()
    {
        return $this->hasOne('App\Models\MeetingAudit', 'meeting_id', 'id');
    }

    public function initiateUser()
    {
        return $this->belongsTo('App\Models\User', 'initiate_user_id');
    }

    public function attendUsersMiddle()
    {
        return $this->hasMany('App\Models\MeetingUser', 'meeting_id');
    }

    public function attendUsers()
    {
        return $this->hasManyThrough(
            'App\Models\User',
            'App\Models\MeetingUser',
            'meeting_id',
            'id',
            'id',
            'user_id'
        );
    }

    public function getTypeFormatAttribute()
    {
        return array_flip(self::TYPE)[$this->type];
    }

    public function getAttendUsersCountAttribute()
    {
        return $this->attendUsersMiddle()->count();
    }
}
