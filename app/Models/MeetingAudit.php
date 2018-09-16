<?php

namespace App\Models;

class MeetingAudit extends _BaseModel
{
    public const STATUS = [
        '未审核' => 0,
        '初审失败' => -2,
        '初审成功' => 2,
        '预约失败' => -3,
        '预约成功' => 3,
        '通过审核' => 4
    ];

    protected $fillable = ['audit_user_id', 'status'];

    protected $appends = ['status_format'];

    public function meeting()
    {
        return $this->belongsTo('App\Models\Meeting', 'meeting_id');
    }

    public function auditUser()
    {
        return $this->hasOne('App\Models\User', 'id', 'audit_user_id');
    }

    public function getStatusFormatAttribute()
    {
        return array_flip(self::STATUS)[$this->status];
    }
}
