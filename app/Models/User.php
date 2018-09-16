<?php

namespace App\Models;

class User extends _BaseModel
{
    const TYPE = ['超级管理员' => 0, '领导' => 1, '党员' => 2, '群众' => 3];

    protected $appends = ['type_format','borned_at_format'];
    protected $casts = [
        'more' => 'json',
    ];

    //TODO 批量查询隐藏掉登录用户名和密码

    public function department()
    {
        return $this->belongsTo('App\Models\Department', 'department_id');
    }

    //党员经历
    public function partyExperience()
    {
        return $this->hasOne('App\Models\UserInfoPartyExperience', 'user_id', 'id');
    }

    //党员关系
    public function partyRelation()
    {
        return $this->hasMany('App\Models\UserInfoPartyRelation', 'user_id');
    }

    public function uploadFiles()
    {
        return $this->hasMany('App\Models\UploadFileLog', 'user_id');
    }

    public function payments()
    {
        return $this->hasMany('App\Models\UserPayment', 'user_id');
    }

    public function notifications()
    {
        return $this->hasMany('App\Models\UserNotification', 'user_id');
    }

    public function leaveComments()
    {
        return $this->hasMany('App\Models\UserComment', 'user_id');
    }

    public function receiveComments()
    {
        return $this->hasMany('App\Models\UserComment', 'to_user_id');
    }

    public function auditComments()
    {
        return $this->hasManyThrough(
            'App\Models\UserComment',
            'App\Models\UserCommentAudit',
            'audit_user_id',
            'id',
            'id',
            'comment_id'
        );
    }

    public function posts()
    {
        return $this->hasMany('App\Models\PortalPost', 'user_id');
    }

    public function auditPosts()
    {
        return $this->hasManyThrough(
            'App\Models\PortalPost',
            'App\Models\ExamPaperAudit',
            'audit_user_id',
            'id',
            'id',
            'post_id'
        );
    }

    public function initiateMeetings()
    {
        return $this->hasMany('App\Models\Meeting', 'initiate_user_id');
    }

    public function auditMeetings()
    {
        return $this->hasManyThrough(
            'App\Models\Meeting',
            'App\Models\MeetingAudit',
            'audit_user_id',
            'id',
            'id',
            'meeting_id'
        );
    }

    public function attendMeetings()
    {
        return $this->hasManyThrough(
            'App\Models\Meeting',
            'App\Models\MeetingUser',
            'user_id',
            'id',
            'id',
            'meeting_id'
        );
    }

    public function initiateVotes()
    {
        return $this->hasMany('App\Models\Vote', 'initiate_user_id');
    }

    public function attendVotes()
    {
        return $this->hasManyThrough(
            'App\Models\Vote',
            'App\Models\VoteUser',
            'user_id',
            'id',
            'id',
            'vote_id'
        );
    }

    public function examResults()
    {
        return $this->hasMany('App\Models\ExamUserResult', 'user_id');
    }

    public function getTypeFormatAttribute()
    {
        return array_flip(self::TYPE)[$this->type];
    }

    public function getBornedAtFormatAttribute()
    {
        return $this->borned_at ? date("Y-m-d", $this->borned_at) : '';
    }
}
