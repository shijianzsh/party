<?php

namespace App\Models;

class Vote extends _BaseModel
{
    public function options(){
        return $this->hasMany('App\Models\VoteOption', 'vote_id');
    }

    public function attendUsers(){
        return $this->hasMany('App\Models\VoteUser', 'vote_id');
    }
}
