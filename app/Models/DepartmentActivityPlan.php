<?php

namespace App\Models;

class DepartmentActivityPlan extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];
    protected $appends = ['attend_type_format', 'attend_users_count'];

    const ATTEND_TYPE = ['未知状态' => 0, '自愿报名' => 1, '下发通知' => 2];

    public function department()
    {
        return $this->belongsTo('App\Models\Department', 'department_id');
    }

    public function initiateUser()
    {
        return $this->belongsTo('App\Models\User', 'initiate_user_id');
    }

    public function attendUsersMiddle()
    {
        return $this->hasMany('App\Models\DepartmentActivityPlanUser', 'activity_id');
    }

    public function attendUsers()
    {
        return $this->hasManyThrough(
            'App\Models\User',
            'App\Models\DepartmentActivityPlanUser',
            'activity_id',
            'id',
            'id',
            'user_id'
        );
    }

    public function getAttendTypeFormatAttribute()
    {
        return array_flip(self::ATTEND_TYPE)[$this->attend_type];
    }

    public function getAttendUsersCountAttribute()
    {
        return $this->attendUsersMiddle()->count();
    }
}
