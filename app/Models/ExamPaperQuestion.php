<?php

namespace App\Models;

class ExamPaperQuestion extends _BaseModel
{
    protected $casts = [
        'options' => 'json',
        'answers' => 'json',
    ];

    protected $fillable = ['question_id', 'question_score', 'title', 'options', 'answers'];

    protected $appends = [
        'options_android_format',
    ];

    public function paper()
    {
        return $this->belongsTo('App\Models\ExamPaper', 'paper_id');
    }

    public function getOptionsAndroidFormatAttribute()
    {
        $options = $this->options;
        $result = [];
        foreach ($options as $key => $value) {
            $result[] = "$key:$value";
        }
        return $result;
    }
}
