<?php

namespace App\Models;

class UserPayment extends _BaseModel
{
    const TYPE = ['未知类型' => 0, '微信支付' => 1, '支付宝支付' => 2,];

    protected $appends = ['type_format', 'amount_format'];

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function getTypeFormatAttribute()
    {
        return array_flip(self::TYPE)[$this->type];
    }

    public function getAmountFormatAttribute()
    {
        return ((string)$this->amount / 100) . '元';
    }
}
