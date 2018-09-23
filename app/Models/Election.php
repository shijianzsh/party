<?php

namespace App\Models;

class Election extends _BaseModel
{
    protected $appends = ['is_publicized_format'];

    public function initiateUser()
    {
        return $this->belongsTo('App\Models\User', 'initiate_user_id');
    }

    public function options()
    {
        return $this->hasMany('App\Models\ElectionOption', 'Election_id');
    }

    public function attendUsers()
    {
        return $this->hasMany('App\Models\ElectionUser', 'Election_id');
    }

    public function results()
    {
        return $this->hasMany('App\Models\ElectionResult', 'Election_id');
    }

    public function getIsPublicizedFormatAttribute()
    {
        return $this->is_publicized ? '是' : '否';
    }
}
