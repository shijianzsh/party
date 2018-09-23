<?php

namespace App\Models;

class ElectionUser extends _BaseModel
{
    public function Election()
    {
        return $this->belongsTo('App\Models\Election', 'Election_id');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function option()
    {
        return $this->hasOne('App\Models\ElectionOption', 'select_option_id', 'id');
    }
}
