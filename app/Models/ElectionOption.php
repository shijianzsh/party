<?php

namespace App\Models;

class ElectionOption extends _BaseModel
{
    public function election()
    {
        return $this->belongsTo('App\Models\Election', 'election_id');
    }

    public function contentUser()
    {
        return $this->hasOne('App\Models\User', 'id', 'content_user_id');
    }

    public function results()
    {
        return $this->hasMany('App\Models\ElectionResult', 'option_id');
    }
}
