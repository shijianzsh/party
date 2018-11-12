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
        'published_at' => 'int',
        'more' => 'json',
        'category_ids' => 'array',
    ];
    protected $appends = [
        'category_name',
        'category_id',
        'category_ids',
        'audit_status_format',
        'created_at_format',
        'updated_at_format',
        'published_at_format',
        'thumbnail_format',
        'video_format',
    ];

    public function audit()
    {
        return $this->hasOne('App\Models\PortalPostAudit', 'post_id', 'id');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function categoryMiddle()
    {
        return $this->hasMany(
            'App\Models\PortalCategoryPost',
            'post_id',
            'id'
        );
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

    public function comments()
    {
        return $this->hasMany('App\Models\PortalPostComment', 'post_id');
    }

    public function getCategoryIdsAttribute()
    {
        $categorys = $this->categorys->toArray();
        return array_column($categorys, 'id');
    }

    public function getCategoryIdAttribute()
    {
        return count($this->category_ids) ? $this->category_ids[0] : null;
    }

    public function getCategoryNameAttribute()
    {
        $categorys = $this->categorys->toArray();
        return count($categorys) ? $categorys[0]['name'] : '无';
    }

    public function getAuditStatusFormatAttribute()
    {
        switch ($this->need_audit) {
            case 1:
                if (empty($this->audit)) {
                    return '获取审核信息失败';
                }
                return array_flip(PortalPostAudit::STATUS)[$this->audit->status];
            default:
                return '无需审核';
        }
    }

    public function setCategoryIdsAttribute($value)
    {
        $this->attributes['first_name'] = strtolower($value);
    }

    public function getVideoFormatAttribute()
    {
        $more = $this->more;
        if (empty($more)) {
            return null;
        }

        if (!is_array($more)) {
            return null;
        }

        if (!array_key_exists('videos', $more)) {
            return null;
        }

        if (!is_array($more['videos'])) {
            return null;
        }

        if (empty($more['videos'])) {
            return null;
        }

        $video = $more['videos'][0];

        return array_key_exists('url', $video) ? $video['url'] : null;
    }
}
