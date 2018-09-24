<?php

namespace App\Models;

class ElectionUser extends _BaseModel
{
    public function election()
    {
        return $this->belongsTo('App\Models\Election', 'election_id');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function option()
    {
        return $this->hasOne('App\Models\ElectionOption', 'select_option_id', 'id');
    }

    public function results()
    {
        return $this->hasMany('App\Models\ElectionResult', 'user_id', 'user_id');
    }
}
