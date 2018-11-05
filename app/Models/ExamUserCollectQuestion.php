<?php

namespace App\Models;

class ExamUserCollectQuestion extends _BaseModel
{
    protected $fillable = ['paper_id','question_id','snapshot'];

    protected $casts = [
        'snapshot' => 'json',
    ];

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function paper()
    {
        return $this->belongsTo('App\Models\ExamPaper', 'paper_id');
    }

    public function question()
    {
        return $this->belongsTo('App\Models\ExamQuestion', 'question_id');
    }
}
