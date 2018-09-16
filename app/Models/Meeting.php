<?php

namespace App\Models;

class Meeting extends _BaseModel
{
    const TYPE = ['未知类型' => 0, '线下' => 1, '线上' => 2];

    protected $appends = [
        'type_format',
        'attend_users_count',
        'opened_at_format',
        'meeting_leader', 'meeting_leader_name_format',
        'meeting_attend_user', 'meeting_attend_user_name_format',
    ];

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
        if ($this->type !== null) {
            return array_flip(self::TYPE)[$this->type];
        } else {
            return null;
        }
    }

    public function getAttendUsersCountAttribute()
    {
        return $this->attendUsersMiddle()->count();
    }

    public function getOpenedAtFormatAttribute()
    {
        return $this->opened_at ? date("Y-m-d H:i:s", $this->opened_at) : '';
    }

    //获取会议领导
    public function getMeetingLeaderAttribute()
    {
        $middleUsers = $this
            ->attendUsersMiddle()
            ->where('type', MeetingUser::TYPE['参会领导'])
            ->select('id', 'user_id', 'type', 'created_at', 'updated_at')
            ->get()
            ->toArray();
        $ids = array_column($middleUsers, 'user_id');
        if (!count($ids)) {
            return [];
        }
        return User::whereIn('id', $ids)->get()->toArray();
    }

    public function getMeetingLeaderNameFormatAttribute()
    {
        $arr = $this->meeting_leader;
        return implode(",", array_column($arr, 'name'));
    }

    //获取会议普通参会人
    public function getMeetingAttendUserAttribute()
    {
        $middleUsers = $this
            ->attendUsersMiddle()
            ->where('type', MeetingUser::TYPE['参会人员'])
            ->select('id', 'user_id', 'type', 'created_at', 'updated_at')
            ->get()
            ->toArray();
        $ids = array_column($middleUsers, 'user_id');
        if (!count($ids)) {
            return [];
        }
        return User::whereIn('id', $ids)->get()->toArray();
    }

    public function getMeetingAttendUserNameFormatAttribute()
    {
        $arr = $this->meeting_attend_user;
        return implode(",", array_column($arr, 'name'));
    }
}
