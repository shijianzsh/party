<?php

namespace App\Models;

class User extends _BaseModel
{
    const TYPE = ['超级管理员' => 0, '领导' => 1, '党员' => 2, '群众' => 3];

    protected $appends = ['type_format', 'borned_at_format', 'thumbnail_format', 'role_ids', 'roles_format'];
    protected $casts = [
        'more' => 'json',
    ];

    /**
     * 拥有的角色
     */
    public function rolesMiddle()
    {
        return $this->hasMany('App\Models\AuthRoleUser', 'user_id');
    }

    public function roles()
    {
        return $this->hasManyThrough(
            'App\Models\AuthRole',
            'App\Models\AuthRoleUser',
            'user_id',
            'id',
            'id',
            'auth_role_id'
        );
    }

    /**
     * 所属的党支部
     */
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

    /**
     * 上传的文件
     */
    public function uploadFiles()
    {
        return $this->hasMany('App\Models\UploadFileLog', 'user_id');
    }

    /**
     * 支付记录
     */
    public function payments()
    {
        return $this->hasMany('App\Models\UserPayment', 'user_id');
    }

    /**
     * 通知记录
     */
    public function notifications()
    {
        return $this->hasMany('App\Models\UserNotification', 'user_id');
    }

    /**
     * 用户发起的留言
     */
    public function leaveComments()
    {
        return $this->hasMany('App\Models\UserComment', 'user_id');
    }

    /**
     * 用户收到的留言
     */
    public function receiveComments()
    {
        return $this->hasMany('App\Models\UserComment', 'to_user_id');
    }

    /**
     * 需要用户审核的留言
     */
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

    /**
     * 用户发表的文章
     */
    public function posts()
    {
        return $this->hasMany('App\Models\PortalPost', 'user_id');
    }

    /**
     * 需要用户审核的文章
     */
    public function auditPosts()
    {
        return $this->hasManyThrough(
            'App\Models\PortalPost',
            'App\Models\PortalPostAudit',
            'audit_user_id',
            'id',
            'id',
            'post_id'
        );
    }

    /**
     * 文章留言
     */
    public function postComments()
    {
        return $this->hasMany('App\Models\PortalPostComment', 'user_id');
    }

    /**
     * 用户发起的会议
     */
    public function initiateMeetings()
    {
        return $this->hasMany('App\Models\Meeting', 'initiate_user_id');
    }

    /**
     * 需要用户审核的会议
     */
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

    /**
     * 用户可以参加/参加过的会议
     */
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

    /**
     * 用户发起的投票
     */
    public function initiateElection()
    {
        return $this->hasMany('App\Models\Election', 'initiate_user_id');
    }

    /**
     * 用户参加的投票
     */
    public function attendElection()
    {
        return $this->hasManyThrough(
            'App\Models\Election',
            'App\Models\ElectionUser',
            'user_id',
            'id',
            'id',
            'election_id'
        );
    }

    /**
     * 用户发起的表决
     */
    public function initiateVotes()
    {
        return $this->hasMany('App\Models\Vote', 'initiate_user_id');
    }

    /**
     * 用户参加的表决
     */
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

    /**
     * 用户的上传的题库excel文件
     */
    public function examExcels()
    {
        return $this->hasMany('App\Models\ExamExcel', 'user_id');
    }

    /**
     * 用户的发起的考试
     */
    public function examPapers()
    {
        return $this->hasMany('App\Models\ExamPaper', 'initiate_user_id');
    }

    /**
     * 用户参加的考试
     */
    public function attendExamPapers()
    {
        return $this->hasManyThrough(
            'App\Models\ExamPaper',
            'App\Models\ExamPaperUser',
            'user_id',
            'id',
            'id',
            'paper_id'
        );
    }

    /**
     * 用户的考试历史
     */
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

    public function getRoleIdsAttribute()
    {
        return array_column($this->roles->toArray(), 'id');
    }

    public function getRolesFormatAttribute()
    {
        $names = array_column($this->roles->toArray(), 'name');
        return implode('，', $names);
    }
}
