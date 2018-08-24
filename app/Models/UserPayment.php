<?php

namespace App\Models;

class UserPayment extends _BaseModel
{
    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
}
