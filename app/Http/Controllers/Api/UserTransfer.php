<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use  App\Models\UserTransferDepartment_;
use Illuminate\Support\Facades\Crypt;
use Gate;

class UserTransfer extends \App\Http\Controllers\Controller
{
    public function audit(Request $request, $user_id)
    {
        $result = UserTransferDepartment_::auditTransfer($user_id, $request->input('data'));
        return response()->json($result);
    }
}
