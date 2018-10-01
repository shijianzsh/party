<?php

namespace App\Models;

class PortalPostComment extends _BaseModel
{
    const PAGE_SIZE = 3;
    protected $appends = [
        'user_name',
        'user_thumbnail_format',
    ];

    public function post()
    {
        return $this->belongsTo('App\Models\PortalPost', 'post_id');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function getUserNameAttribute()
    {
        return $this->user['name'];
    }

    public function getUserThumbnailFormatAttribute()
    {
        $more = $this->user['more'];

        if ($more === null) {
            return null;
        }

        if (!is_array($more)) {
            return null;
        }

        if (!array_key_exists('thumbnail', $more)) {
            return null;
        }

        return $more['thumbnail'];
    }
}
