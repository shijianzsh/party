<?php

namespace App\Models;

class ExamUserResult extends _BaseModel
{
    protected $casts = [
        'paper_snapshoot' => 'json',
        'answers_snapshoot' => 'json',
    ];

    public function user()
    {
        return $this->belongsTo('App\Models\User','user_id');
    }

    public function paper()
    {
        return $this->belongsTo('App\Models\ExamPaper','paper_id');
    }
}
