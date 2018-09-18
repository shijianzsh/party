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

    public function getPublishedList(Request $request)
    {
        $filter = json_decode($request->query('filter') ? $request->query('filter') : [], true);
        $list = PortalPost_::getPublishedPostList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'category_id' => &$filter['category_id'],
                'is_published' => &$filter['is_published'],
                'keyword' => &$filter['keyword'],
                'start_timestamp' => &$filter['start_timestamp'],
                'end_timestamp' => &$filter['end_timestamp'],
            ],
            ['user']
        );

        $result = ['success' => 1, 'data' => $list, '$request' => $request->query(), '$filter' => $filter];
        return response()->json($result);
    }
}
