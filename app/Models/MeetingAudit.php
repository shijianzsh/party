<?php

namespace App\Models;

class MeetingAudit extends _BaseModel
{
    protected $fillable = ['audit_user_id','status'];

    public function meeting()
    {
        return $this->belongsTo('App\Models\Meeting', 'meeting_id');
    }

    public function auditUser()
    {
        return $this->hasOne('App\Models\User', 'id', 'audit_user_id');
    }
}
