<?php

namespace App\Models;

class ExamExcel extends _BaseModel
{
    protected $casts = [
        'more' => 'json',
    ];
    protected $appends = ['user_name', 'category_name'];

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function category()
    {
        return $this->belongsTo('App\Models\ExamCategory', 'category_id');
    }

    public function questions()
    {
        return $this->hasMany('App\Models\ExamQuestion', 'excel_id');
    }

    public function getUserNameAttribute()
    {
        return $this->user ? $this->user->name : null;
    }

    public function getCategoryNameAttribute()
    {
        return $this->category ? $this->category->name : null;
    }
}
