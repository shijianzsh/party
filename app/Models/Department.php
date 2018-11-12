<?php

namespace App\Models;

class Department extends _BaseModel
{
    //坐标的范围
    const COORDINATES_RANGE = ['x' => ['min' => 73, 'max' => 135], 'y' => ['min' => 17, 'max' => 53]];

    protected $casts = [
        'more' => 'json',
    ];
    protected $appends = ['level', 'users_count', 'coordinates_format', 'thumbnail_format', 'monitor_map_format'];

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

    public function meetings()
    {
        return $this->hasMany('App\Models\Meeting', 'department_id');
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

    public function projects()
    {
        //工作计划
        return $this->hasMany('App\Models\DepartmentProject', 'department_id');
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

    public function setCoordinateXAttribute($value)
    {
        $this->attributes['coordinate_x'] = $value * 1000000;
    }

    public function getCoordinateXAttribute($value)
    {
        return $value / 1000000;
    }

    public function setCoordinateYAttribute($value)
    {
        $this->attributes['coordinate_y'] = $value * 1000000;
    }

    public function getCoordinateYAttribute($value)
    {
        return $value / 1000000;
    }

    public function getCoordinatesFormatAttribute()
    {
        return [$this->coordinate_x, $this->coordinate_y];
    }

    public function getMonitorMapFormatAttribute()
    {
        $more = $this->more;
        if ($more === null) {
            return null;
        }

        if (!is_array($more)) {
            return null;
        }

        if (!array_key_exists('monitor_map', $more)) {
            return null;
        }

        return $more['monitor_map'];
    }
}
