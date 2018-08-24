<?php

namespace App\Models;

class Meeting extends _BaseModel
{
    public function audit()
    {
        return $this->hasOne('App\Models\MeetingAudit','meeting_id','id');
    }

    public function initiateUser()
    {
        return $this->belongsTo('App\Models\User','initiate_user_id');
    }

    public function attendUsers(){
        return $this->hasManyThrough(
            'App\Models\User',
            'App\Models\MeetingUser',
            'meeting_id',
            'id',
            'id',
            'user_id'
        );
    }
}
