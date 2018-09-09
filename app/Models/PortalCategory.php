<?php

namespace App\Models;

class PortalCategory extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];
    protected $appends = ['level', 'posts_count'];

    public function parent()
    {
        return $this->belongsTo('App\Models\PortalCategory', 'parent_id');
    }

    public function children()
    {
        return $this->hasMany('App\Models\PortalCategory', 'parent_id');
    }

    public function siblings()
    {
        return $this->hasMany('App\Models\PortalCategory', 'parent_id', 'parent_id');
    }

    public function postsMiddle()
    {
        return $this->hasMany('App\Models\PortalCategoryPost', 'category_id');
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

    public function getPostsCountAttribute()
    {
        return $this->posts()->count();
    }

    public function getLevelAttribute()
    {
        return substr_count($this->path, '-');
    }

    public function setPathAttribute($value)
    {
        if ($this->parent_id === 0 || !$this->parent_id) {
            $this->attributes['path'] = "0-";
        } else {
            $this->attributes['path'] =
                "{$this->parent->path}{$this->parent->id}-";
        }
    }
}
