<?php

namespace App\Models;

class Department extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];
    protected $appends = ['level', 'users_count'];

    public function parent()
    {
        return $this->belongsTo('App\Models\Department', 'parent_id');
    }

    public function children()
    {
        return $this->hasMany('App\Models\Department', 'parent_id');
    }

    public function users()
    {
        return $this->hasMany('App\Models\User', 'department_id');
    }

    public function workPlans()
    {
        //工作规划
        return $this->hasMany('App\Models\DepartmentWorkPlan', 'department_id');
    }

    public function activityPlans()
    {
        //活动规划
        return $this->hasMany('App\Models\DepartmentActivityPlan', 'department_id');
    }

    public function getUsersCountAttribute()
    {
        return $this->users()->count();
    }

    public function getLevelAttribute()
    {
        return substr_count($this->path, '-');
    }

    public function setPathAttribute($value)
    {
        if ($this->parent_id === 0) {
            $this->attributes['path'] = "0-";
        } else {
            $this->attributes['path'] =
                "{$this->parent->path}{$this->parent->id}-";
        }
    }
}
