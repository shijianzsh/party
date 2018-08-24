<?php

namespace App\Models;

class ExamQuestion extends _BaseModel
{
    protected $casts = [
        'status' => 'integer',
        'options' => 'json',
        'answers' => 'json',
    ];

    protected $fillable = ['excel_index', 'disabled', 'title', 'options', 'answers'];

    public function excel()
    {
        return $this->belongsTo('App\Models\ExamExcel', 'excel_id');
    }
}
