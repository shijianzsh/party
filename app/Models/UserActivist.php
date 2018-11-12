<?php

namespace App\Models;

class UserActivist extends _BaseModel
{
    const AUDIT_STATUS = [
        '未知状态' => 0,
        '未初审' => 1,
        '初审通过' => 2,
        '初审未通过' => 3,
        '约谈' => 4,
        '群众' => 5,
    ];

    protected $fillable = ['code', 'status', 'audit_user_id', 'recommend_user_id'];

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
        return $this->hasOne('App\Models\User', 'id', 'audit_user_id');
    }

    public function recommendUser()
    {
        return $this->hasOne('App\Models\User', 'id', 'recommend_user_id');
    }

    public function getAuditStatusFormatAttribute()
    {
        return $this->audit_status;
        return array_flip(self::AUDIT_STATUS)[$this->audit_status];
    }
}
