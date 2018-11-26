<?php

namespace App\Models;

class Election extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];
    protected $appends = [
        'is_publicized_format',
        'attend_user_ids',//预计要参加投票的ids
        'election_user_ids',//选举人员ids
        'result_user_ids',//参加了投票的ids
//        'option_user_ids',
        'started_at_format',
        'ended_at_format',
    ];

    public function initiateUser()
    {
        return $this->belongsTo('App\Models\User', 'initiate_user_id');
    }

    public function options()
    {
        return $this->hasMany('App\Models\ElectionOption', 'election_id');
    }

    public function attendUsersMiddle()
    {
        return $this->hasMany('App\Models\ElectionUser', 'election_id');
    }

    public function attendUsers()
    {
        return $this->hasManyThrough(
            'App\Models\User',
            'App\Models\ElectionUser',
            'election_id',
            'id',
            'id',
            'user_id'
        );
    }

    public function results()
    {
        return $this->hasMany('App\Models\ElectionResult', 'election_id');
    }

    public function getIsPublicizedFormatAttribute()
    {
        return $this->is_publicized ? '是' : '否';
    }

    public function getAttendUserIdsAttribute()
    {
        $rows = $this->attendUsersMiddle;
        return $rows ? array_column($rows->toArray(), 'user_id') : [];
    }

    public function getElectionUserIdsAttribute()
    {
        $rows = $this->options;
        return $rows ? array_column($rows->toArray(), 'user_id') : [];
    }

    public function getResultUserIdsAttribute()
    {
        $rows = $this->results;
        return $rows ? array_unique(array_column($rows->toArray(), 'user_id')) : [];
    }

//    public function getOptionUserIdsAttribute()
//    {
//        $rows = $this->options;
//        return $rows ? array_unique(array_column($rows->toArray(), 'content_user_id')) : [];
//    }
}
