<?php

namespace App\Models;

class UserCommentAudit extends _BaseModel
{
    public function comment()
    {
        return $this->belongsTo('App\Models\UserComment','comment_id');
    }
}
