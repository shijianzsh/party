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

    protected $appends = [
        'options_android_format',
    ];

    public function excel()
    {
        return $this->belongsTo('App\Models\ExamExcel', 'excel_id');
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
