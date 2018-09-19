<?php

namespace App\Models;

class UserComment extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];

    protected $appends = ['to_user_ids', 'user_name'];

    //发起人
    public function initiateUser()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    //中间表
    public function commentUsersMiddle()
    {
        return $this->hasMany('App\Models\UserCommentUser', 'comment_id');
    }

    public function commentUsers()
    {
        return $this->hasManyThrough(
            'App\Models\User',
            'App\Models\UserCommentUser',
            'comment_id',
            'id',
            'id',
            'user_id'
        );
    }

    public function audit()
    {
        return $this->hasOne('App\Models\UserCommentAudit', 'comment_id', 'id');
    }

    public function getUserNameAttribute()
    {
        return !$this->initiateUser ? null : $this->initiateUser->name;
    }

    public function getToUserIdsAttribute()
    {
        if (!$this->comment_users) {
            return [];
        }
        return array_column($this->comment_users, 'id');
    }
}
