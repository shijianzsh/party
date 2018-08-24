<?php

namespace App\Models;

class ExamExcel extends _BaseModel
{
    public function category()
    {
        return $this->belongsTo('App\Models\ExamCategory','category_id');
    }

    public function questions()
    {
        return $this->hasMany('App\Models\ExamQuestion','excel_id');
    }
}
