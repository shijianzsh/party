<?php

namespace App\Models;

class ExamPaper extends _BaseModel
{
    public const IsRestrictUserMap = ['否' => 0, '是' => 1];

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
}
