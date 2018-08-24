<?php

namespace App\Models;

class User extends _BaseModel
{
    public function department()
    {
        return $this->belongsTo('App\Models\Department','department_id');
    }

    public function uploadFiles(){
    return $this->hasMany('App\Models\UploadFileLog', 'user_id');
}

    public function payments(){
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

    public function auditComments(){
        return $this->hasManyThrough(
            'App\Models\UserComment',
            'App\Models\UserCommentAudit',
            'audit_user_id',
            'id',
            'id',
            'comment_id'
        );
    }

    public function posts(){
        return $this->hasMany('App\Models\PortalPost', 'user_id');
    }

    public function auditPosts(){
        return $this->hasManyThrough(
            'App\Models\PortalPost',
            'App\Models\ExamPaperAudit',
            'audit_user_id',
            'id',
            'id',
            'post_id'
        );
    }

    public function initiateMeetings(){
        return $this->hasMany('App\Models\Meeting', 'initiate_user_id');
    }

    public function auditMeetings(){
        return $this->hasManyThrough(
            'App\Models\Meeting',
            'App\Models\MeetingAudit',
            'audit_user_id',
            'id',
            'id',
            'meeting_id'
        );
    }

    public function attendMeetings(){
        return $this->hasManyThrough(
            'App\Models\Meeting',
            'App\Models\MeetingUser',
            'user_id',
            'id',
            'id',
            'meeting_id'
        );
    }

    public function initiateVotes(){
        return $this->hasMany('App\Models\Vote', 'initiate_user_id');
    }

    public function attendVotes(){
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
}
