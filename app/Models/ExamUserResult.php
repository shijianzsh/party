<?php

namespace App\Models;

class ExamUserResult extends _BaseModel
{
    protected $casts = [
        'paper_snapshot' => 'json',
        'answers_snapshot' => 'json',
    ];

    protected $appends = ['is_passed_format', 'submitted_at','created_at_format','updated_at_format'];

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function paper()
    {
        return $this->belongsTo('App\Models\ExamPaper', 'paper_id');
    }

    public function getIsPassedFormatAttribute()
    {
        return (bool)$this->is_passed ? '通过' : '未通过';
    }

    public function getSubmittedAtAttribute()
    {
        return $this->created_at->timestamp + $this->paper->duration * 60;
    }
}
