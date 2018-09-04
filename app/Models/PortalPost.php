<?php

namespace App\Models;

class PortalPost extends _BaseModel
{
    protected $casts = [
        'user_id' => 'int',
        'need_audit' => 'int',
        'post_status' => 'int',
        'comment_status' => 'int',
        'is_top' => 'int',
        'recommended' => 'int',
        'published_at' => 'int',
        'more' => 'json',
        'category_ids' => 'array',
    ];
    protected $appends = ['category_id','category_ids'];

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

    public function getCategoryIdsAttribute()
    {
        $categorys = $this->categorys->toArray();
        return array_column($categorys, 'id');
    }

    public function getCategoryIdAttribute()
    {
        return count($this->category_ids)?$this->category_ids[0]:null;
    }

    public function setCategoryIdsAttribute($value)
    {
        $this->attributes['first_name'] = strtolower($value);
    }
}
