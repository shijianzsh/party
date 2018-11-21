<?php

namespace App\Models;

/**
 * 轮播图Item表
 */
class PortalCarouselItem extends _BaseModel
{
    public function carousel()
    {
        return $this->belongsTo('App\Models\PortalCarousel', 'carousel_id');
    }
}
