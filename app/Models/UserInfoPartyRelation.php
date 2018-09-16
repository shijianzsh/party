<?php

namespace App\Models;

class UserInfoPartyRelation extends _BaseModel
{
    protected $appends = [
        'started_at_format',
        'ended_at_format',
    ];

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function getStartedAtFormatAttribute()
    {
        return $this->started_at ? date("Y-m-d", $this->started_at) : '';
    }

    public function getEndedAtFormatAttribute()
    {
        return $this->ended_at ? date("Y-m-d", $this->ended_at) : '';
    }
}
