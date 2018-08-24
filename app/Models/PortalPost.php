<?php

namespace App\Models;

class PortalPost extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];

    public function audit()
    {
        return $this->hasOne('App\Models\PortalPostAudit', 'post_id', 'id');
    }

    public function categorys()
    {
        return $this->hasManyThrough(
            'App\Models\PortalCategory',
            'App\Models\PortalCategoryPost',
            'post_id',
            'id',
            'id',
            'category_id'
        );
    }
}
