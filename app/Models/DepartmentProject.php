<?php

namespace App\Models;

class DepartmentProject extends _BaseModel
{
    protected const AUDIT_STATUS = ['未审核' => 0, '通过' => 1, '未通过' => 2];
    protected $casts = [
        'more' => 'json',
    ];
    protected $appends = [
        'created_at_format',
        'updated_at_format',
        'audit_status_format',
        'initiate_user_name_format',
        'audit_user_name_format',
    ];

    public function department()
    {
        return $this->belongsTo('App\Models\Department', 'department_id');
    }

    public function initiateUser()
    {
        return $this->belongsTo('App\Models\User', 'initiate_user_id');
    }

    public function auditUser()
    {
        return $this->belongsTo('App\Models\User', 'audit_user_id');
    }

    public function steps()
    {
        return $this->hasMany('App\Models\DepartmentProjectStep', 'projects_id');
    }

    public function getAuditStatusFormatAttribute()
    {
        return array_flip(self::AUDIT_STATUS)[$this->audit_status];
    }

    public function getAuditUserNameFormatAttribute()
    {
        return !empty($this->auditUser) ? $this->auditUser->user_name : null;
    }

    public function getInitiateUserNameFormatAttribute()
    {
        return !empty($this->initiateUser) ? $this->initiateUser->user_name : null;
    }
}
