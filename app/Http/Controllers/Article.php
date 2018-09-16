<?php

namespace App\Http\Controllers;

use App\Models\PortalPost;
use Illuminate\Http\Request;
use  App\Models\PortalPost_;
use Illuminate\Support\Facades\Crypt;
use Gate;

class Article extends Controller
{
    public function audit(Request $request, $id)
    {
        $result = PortalPost_::auditPost($id,
            $request->input('status'),
            $request->input('reason',''));
        return response()->json($result);
    }
}
