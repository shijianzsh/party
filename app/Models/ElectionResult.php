<?php

namespace App\Models;

class ElectionResult extends _BaseModel
{
    public function election()
    {
        return $this->belongsTo('App\Models\Election', 'election_id');
    }

    public function attendUsersMiddle()
    {
        return $this->belongsTo('App\Models\ElectionUser', 'user_id', 'user_id');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function option()
    {
        return $this->belongsTo('App\Models\ElectionOption', 'option_id');
    }
}
