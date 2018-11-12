<?php

namespace App\Models;

class DepartmentProjectStep extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];

    public function project()
    {
        return $this->belongsTo('App\Models\DepartmentProject', 'project_id');
    }

    public function chargeUser()
    {
        return $this->belongsTo('App\Models\User', 'charge_user_id');
    }

    public function operateHistories()
    {
        return $this->hasMany('App\Models\DepartmentProjectStepOperateHistory', 'step_id');
    }
}
