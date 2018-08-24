<?php

namespace App\Models;

class PortalCategory extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];

    public function parent()
    {
        return $this->belongsTo('App\Models\PortalCategory','parent_id');
    }

    public function children()
    {
        return $this->hasMany('App\Models\PortalCategory','parent_id');
    }

    public function posts()
    {
        return $this->hasManyThrough(
            'App\Models\PortalPost',
            'App\Models\PortalCategoryPost',
            'category_id',
            'id',
            'id',
            'post_id'
        );
    }
}
