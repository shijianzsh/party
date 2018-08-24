<?php

namespace App\Models;

class ExamCategory extends _BaseModel
{
    public function excels()
    {
        return $this->hasMany('App\Models\ExamExcel','category_id');
    }

    public function questions(){
        return $this->hasManyThrough(
            'App\Models\ExamQuestion',
            'App\Models\ExamExcel',
            'category_id',
            'excel_id',
            'id',
            'id'
        );
    }
}
