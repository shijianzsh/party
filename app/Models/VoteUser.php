<?php

namespace App\Models;

class VoteUser extends _BaseModel
{
    const VOTE_RESULT = ['未知状态' => 0, '同意' => 1, '不同意' => 2, '弃权' => 3];

    public function vote()
    {
        return $this->belongsTo('App\Models\Vote', 'vote_id');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
}
