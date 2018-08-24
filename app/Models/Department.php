<?php

namespace App\Models;

class Department extends _BaseModel
{
    public function parent()
    {
        return $this->belongsTo('App\Models\Department','parent_id');
    }

    public function children()
    {
        return $this->hasMany('App\Models\Department','parent_id');
    }

    public function users(){
        return $this->hasMany('App\Models\User', 'department_id');
    }
}
