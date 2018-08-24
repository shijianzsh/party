<?php

namespace App\Models;

class ExamUserResult extends _BaseModel
{
    public function user()
    {
        return $this->belongsTo('App\Models\User','user_id');
    }

    public function paper()
    {
        return $this->belongsTo('App\Models\ExamPaper','paper_id');
    }
}
