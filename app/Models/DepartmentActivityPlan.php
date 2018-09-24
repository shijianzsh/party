<?php

namespace App\Models;

class DepartmentActivityPlan extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];
    protected $appends = ['type_format', 'attend_users_count', 'attend_user_ids','attend_user_names_format', 'published_at_format'];

    const TYPE = ['未知状态' => 0, '自愿报名' => 1, '下发通知' => 2];

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

    public function getTypeFormatAttribute()
    {
        return array_flip(self::TYPE)[$this->type];
    }

    public function getAttendUsersCountAttribute()
    {
        return $this->attendUsersMiddle()->count();
    }

    public function getAttendUserIdsAttribute()
    {
        $rows = $this->attendUsersMiddle;
        return $rows ? array_column($rows->toArray(), 'user_id') : [];
    }

    public function getAttendUserNamesFormatAttribute()
    {
        $arr = $this->attendUsers->toArray();
        return implode(",", array_column($arr, 'name'));
    }
}
