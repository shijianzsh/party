<?php

namespace App\Models;

class UserInfoPartyExperience extends _BaseModel
{
    protected $casts = [
        'rdsq_more' => 'json',//入党申请
        'jjfz_more' => 'json',//积极分子
        'fzdx_more' => 'json',//发展对象
        'ybdy_more' => 'json',//预备党员
        'zsdy_more' => 'json',//正式党员
    ];
    protected $appends = [
        'rdsq_passed_at_format',//入党申请
        'jjfz_passed_at_format',//积极分子
        'fzdx_passed_at_format',//发展对象
        'ybdy_passed_at_format',//预备党员
        'zsdy_passed_at_format',//正式党员
    ];

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function getRdsqPassedAtFormatAttribute()
    {
        return $this->rdsq_passed_at ? date("Y-m-d H:i:s", $this->rdsq_passed_at) : '';
    }

    public function getJjfzPassedAtFormatAttribute()
    {
        return $this->jjfz_passed_at ? date("Y-m-d H:i:s", $this->jjfz_passed_at) : '';
    }

    public function getFzdxPassedAtFormatAttribute()
    {
        return $this->fzdx_passed_at ? date("Y-m-d H:i:s", $this->fzdx_passed_at) : '';
    }

    public function getYbdyPassedAtFormatAttribute()
    {
        return $this->ybdy_passed_at ? date("Y-m-d H:i:s", $this->ybdy_passed_at) : '';
    }

    public function getZsdyPassedAtFormatAttribute()
    {
        return $this->zsdy_passed_at ? date("Y-m-d H:i:s", $this->zsdy_passed_at) : '';
    }
}
