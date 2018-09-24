<?php

namespace App\Models;

class Vote extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];
    protected $appends = [
        'is_publicized_format',
        'attend_user_ids',
        'started_at_format',
        'ended_at_format',
        'result_format',
    ];

    public function initiateUser()
    {
        return $this->belongsTo('App\Models\User', 'initiate_user_id');
    }

    public function attendUsersMiddle()
    {
        return $this->hasMany('App\Models\VoteUser', 'vote_id');
    }

    public function attendUsers()
    {
        return $this->hasManyThrough(
            'App\Models\User',
            'App\Models\VoteUser',
            'vote_id',
            'id',
            'id',
            'user_id'
        );
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

    public function getResultFormatAttribute()
    {
        $map = array_flip(VoteUser::VOTE_RESULT);

        $rows = $this->attendUsersMiddle;
        $result = ['同意' => 0, '不同意' => 0, '弃权' => 0];

        for ($i = 0; $i < count($rows); $i++) {
            $row = $rows[$i];
            if (!$row['is_submited']) {
                continue;
            }

            if(!array_key_exists($row['vote_result'],$map)){
                continue;
            }

            if(!array_key_exists($map[$row['vote_result']],$result)){
                continue;
            }

            $result[$map[$row['vote_result']]]++;
        }

        return $result;
    }
}
