<?php

namespace App\Models;

class UserActivist extends _BaseModel
{
    protected $fillable = ['code','status','audit_user_id','recommend_user_id'];

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function auditUser()
    {
        return $this->hasOne('App\Models\User', 'id', 'audit_user_id');
    }

    public function recommendUser()
    {
        return $this->hasOne('App\Models\User', 'id', 'recommend_user_id');
    }
}
