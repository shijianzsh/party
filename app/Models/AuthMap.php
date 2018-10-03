<?php

namespace App\Models;

/**
 * 权限map表
 */
class AuthMap extends _BaseModel
{
    const PAGE_SIZE = 9999;

    protected $appends = ['path_format'];

    public function setMethodAttribute($value)
    {
        $this->attributes['method'] = strtolower($value);
    }

    public function getPathFormatAttribute()
    {
        $result = '';

        if (empty($this->namespace)) return $result;
        $result .= $this->namespace;

        if (empty($this->entrance)) return $result;
        $result .= '|' . $this->entrance;

        if (empty($this->param_1)) return $result;
        $result .= '|' . $this->param_1;

        if (empty($this->param_2)) return $result;
        $result .= '|' . $this->param_2;

        if (empty($this->param_3)) return $result;
        $result .= '|' . $this->param_3;

        return $result;
    }
}
