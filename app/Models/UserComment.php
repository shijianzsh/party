<?php

namespace App\Models;

class UserComment extends _BaseModel
{
    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function toUser()
    {
        return $this->belongsTo('App\Models\User', 'to_user_id');
    }

    public function audit()
    {
        return $this->hasOne('App\Models\UserCommentAudit', 'comment_id', 'id');
    }
}
