<?php

namespace App\Models;

class DepartmentWorkPlan extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];

    public function department()
    {
        return $this->belongsTo('App\Models\Department', 'department_id');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
}
