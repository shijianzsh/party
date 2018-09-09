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

    public function getMoreAttribute($value)
    {
        $value = json_decode($value, true);
        if (!$value) return (array)$value;

        array_walk($value, function (&$value, $key) {
            if ($value) {
                $value = json_decode($value);
            }
        });

        return $value;
    }
}
