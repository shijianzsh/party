<?php

namespace App\Models;

class ExamPaperQuestion extends _BaseModel
{
    protected $casts = [
        'options' => 'json',
        'answer' => 'json',
    ];

    protected $fillable = ['question_id', 'question_score', 'title', 'options', 'answer'];

    public function paper()
    {
        return $this->belongsTo('App\Models\ExamPaper', 'paper_id');
    }
}
