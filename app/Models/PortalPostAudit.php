<?php

namespace App\Models;

class PortalPostAudit extends _BaseModel
{
    const STATUS = ['待审核' => 0, '通过' => 1, '不通过' => 2];
    protected $fillable = ['audit_user_id', 'status'];

    public function post()
    {
        return $this->belongsTo('App\Models\PortalPost', 'post_id');
    }
}
