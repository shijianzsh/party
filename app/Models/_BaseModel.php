<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class _BaseModel extends Model
{
    use \App\Services\CheckParams\CheckParams;

    protected $dateFormat = 'U';
    protected $appends = ['created_at_format'];

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
        //TODO
        return $this->created_at;
    }
}
