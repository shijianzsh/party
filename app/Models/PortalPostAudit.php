<?php

namespace App\Models;

class PortalPostAudit extends _BaseModel
{
    const STATUS = ['未审核' => 0, '通过' => 1, '不通过' => 2];
    protected $fillable = ['audit_user_id', 'status','reason'];

    public function post()
    {
        return $this->belongsTo('App\Models\PortalPost', 'post_id');
    }
}
