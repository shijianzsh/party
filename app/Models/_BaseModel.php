<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class _BaseModel extends Model
{
    use \App\Services\CheckParams\CheckParams;

    protected $dateFormat = 'U';
    protected $appends = ['created_at_format'];
    const PAGE_SIZE = 6;

    public function getTable()
    {
        //重写父类里的getTable 去掉名称自动加s的功能
        if (!isset($this->table)) {
            return str_replace(
                '\\', '', Str::snake(class_basename($this))
            );
        }
        return $this->table;
    }

    public function getCreatedAtFormatAttribute()
    {
        return date("Y-m-d H:i:s", $this->created_at->timestamp);
    }

    public function getUpdatedAtFormatAttribute()
    {
        return $this->updated_at ? date("Y-m-d H:i:s", $this->updated_at->timestamp) : '';
    }

    public function getPublishedAtFormatAttribute()
    {
        return $this->published_at ? date("Y-m-d H:i:s", $this->published_at) : '';
    }

    public function getFinishedAtFormatAttribute()
    {
        return $this->finished_at ? date("Y-m-d H:i:s", $this->finished_at) : '';
    }

    public function getStartedAtFormatAttribute()
    {
        return $this->started_at ? date("Y-m-d H:i:s", $this->started_at) : '';
    }

    public function getEndedAtFormatAttribute()
    {
        return $this->ended_at ? date("Y-m-d H:i:s", $this->ended_at) : '';
    }

    public function getThumbnailFormatAttribute()
    {
        $more = $this->more;
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
