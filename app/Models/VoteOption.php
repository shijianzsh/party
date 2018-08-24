<?php

namespace App\Models;

class VoteOption extends _BaseModel
{
    public function vote()
    {
        return $this->belongsTo('App\Models\Vote', 'vote_id');
    }

    public function contentUser()
    {
        return $this->hasOne('App\Models\User', 'content_user_id', 'id');
    }

    public function voteUsers()
    {
        return $this->hasMany('App\Models\VoteUser', 'select_option_id');
    }
}
