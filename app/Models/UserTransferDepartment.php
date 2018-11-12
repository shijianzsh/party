<?php

namespace App\Models;

class UserTransferDepartment extends _BaseModel
{
    public const AUDIT_STATUS = ['未审核' => 0, '通过' => 1, '未通过' => 2];

    protected $casts = [
        'more' => 'json',
    ];

    protected $appends = [
        'created_at_format',
        'updated_at_format',
        'audit_status_format',
    ];

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function auditUser()
    {
        return $this->belongsTo('App\Models\User', 'audit_user_id');
    }

    public function fromDepartment()
    {
        return $this->belongsTo('App\Models\Department', 'from_department_id');
    }

    public function toDepartment()
    {
        return $this->belongsTo('App\Models\Department', 'to_department_id');
    }

    public function getAuditStatusFormatAttribute()
    {
        return array_flip(self::AUDIT_STATUS)[$this->audit_status];
    }
}
