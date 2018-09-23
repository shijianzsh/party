<?php

namespace App\Models;

class ElectionOption extends _BaseModel
{
    public function Election()
    {
        return $this->belongsTo('App\Models\Election', 'Election_id');
    }

    public function contentUser()
    {
        return $this->hasOne('App\Models\User', 'content_user_id', 'id');
    }

    public function results()
    {
        return $this->hasMany('App\Models\ElectionResult', 'option_id');
    }
}
