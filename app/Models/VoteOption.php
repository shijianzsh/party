<?php

namespace App\Models;

class VoteOption extends _BaseModel
{
    public function vote()
    {
        return $this->belongsTo('App\Models\Vote', 'vote_id');
    }

    public function results()
    {
        return $this->hasMany('App\Models\VoteResult', 'option_id');
    }
}
