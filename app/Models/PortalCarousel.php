<?php

namespace App\Models;

/**
 * 轮播图表
 */
class PortalCarousel extends _BaseModel
{
    public function items()
    {
        return $this->hasMany('App\Models\PortalCarouselItem', 'carousel_id');
    }
}
