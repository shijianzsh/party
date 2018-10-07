<?php

namespace App\Models;

class UserComment extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];

    protected $appends = [
        'to_user_ids',
        'to_user_names_format',
        'user_name',
        'audit_status',
        'audit_status_format',
        'leave_at_format',
    ];

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
        if (!$this->commentUsers) {
            return [];
        }
        return array_column($this->commentUsers->toArray(), 'id');
    }

    public function getToUserNamesFormatAttribute()
    {
        if (!$this->commentUsers) {
            return [];
        }
        $toUserNamesArray = array_column($this->commentUsers->toArray(), 'name');
        return implode(",", $toUserNamesArray);
    }

    public function getAuditStatusAttribute()
    {
        if (!$this->audit) {
            return null;
        }

        return $this->audit->status;
    }

    public function getAuditStatusFormatAttribute()
    {
        if (!$this->audit) {
            return '无需审核';
        }

        return array_flip(UserCommentAudit::STATUS)[$this->audit->status];
    }
}
