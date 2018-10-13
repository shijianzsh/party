<?php

namespace App\Models;

class MeetingAudit extends _BaseModel
{
    public const STATUS = [
        '未审核' => 0,
        '初审成功' => 1,
        '初审失败' => 2,
        '预约成功' => 3,
        '预约失败' => 4,
        '通过审核' => 5,
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
        $arr = array_flip(self::STATUS);
        if (!array_key_exists($this->status, $arr)) {
            return '未知状态';
        }
        return array_flip(self::STATUS)[$this->status];
    }
}
