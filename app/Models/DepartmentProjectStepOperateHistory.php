<?php

namespace App\Models;

class DepartmentProjectStepOperateHistory extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];

    public function projectStep()
    {
        return $this->belongsTo('App\Models\DepartmentProjectStep', 'project_step_id');
    }

    public function operateUser()
    {
        return $this->belongsTo('App\Models\User', 'operate_user_id');
    }
}
