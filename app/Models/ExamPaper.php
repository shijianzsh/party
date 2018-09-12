<?php

namespace App\Models;

use Carbon\Carbon;

class ExamPaper extends _BaseModel
{
    public const IS_RESTRICT_USER = ['否' => 0, '是' => 1];
    public const TIME_STATUS = ['未知状态' => -1, '未开始' => 0, '进行中' => 1, '已结束' => 2];
    protected $appends = ['time_status'];

    public function questions()
    {
        return $this->hasMany('App\Models\ExamPaperQuestion', 'paper_id');
    }

    public function originalQuestions()
    {
        return $this->hasManyThrough(
            'App\Models\ExamQuestion',
            'App\Models\ExamPaperQuestion',
            'paper_id',
            'id',
            'id',
            'question_id'
        );
    }

    public function attendUsersMiddle()
    {
        return $this->hasMany('App\Models\ExamPaperUser', 'paper_id');
    }

    public function attendUsers()
    {
        return $this->hasManyThrough(
            'App\Models\User',
            'App\Models\ExamPaperUser',
            'paper_id',
            'id',
            'id',
            'user_id'
        );
    }

    public function getTimeStatusAttribute()
    {
        if (Carbon::now()->timestamp < $this->published_at) {
            return self::TIME_STATUS['未开始'];
        }

        if (Carbon::now()->timestamp > $this->finished_at) {
            return self::TIME_STATUS['已结束'];
        }

        if (Carbon::now()->timestamp > $this->published_at && Carbon::now()->timestamp < $this->finished_at) {
            return self::TIME_STATUS['进行中'];
        }
        return self::TIME_STATUS['未知状态'];

    }
}
