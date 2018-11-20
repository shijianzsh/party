<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use  App\Models\UserLearningRecord_;
use Illuminate\Support\Facades\Crypt;
use Gate, Cache;

class UserLearningRecord extends \App\Http\Controllers\Controller
{
    public function duration($userId)
    {
        return response()->json(UserLearningRecord_::getLearningRecordDuration($userId));
    }
}
