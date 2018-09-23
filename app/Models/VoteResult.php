<?php

namespace App\Models;

class VoteResult extends _BaseModel
{
    public function vote()
    {
        return $this->belongsTo('App\Models\Vote', 'vote_id');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function option()
    {
        return $this->hasOne('App\Models\VoteOption', 'option_id', 'id');
    }
}
