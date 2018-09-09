<?php

namespace App\Models;

class UserCommentAudit extends _BaseModel
{
    const STATUS = ['待审核' => 0, '通过' => 1, '不通过' => 2];
    protected $fillable = ['audit_user_id', 'status','reason'];

    public function comment()
    {
        return $this->belongsTo('App\Models\UserComment','comment_id');
    }
}
