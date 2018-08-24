<?php

namespace App\Models;

class PortalPostAudit extends _BaseModel
{
    public function post()
    {
        return $this->belongsTo('App\Models\PortalPost','post_id');
    }
}
