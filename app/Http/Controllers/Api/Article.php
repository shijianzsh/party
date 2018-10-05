<?php

namespace App\Http\Controllers\Api;

use App\Models\PortalPost;
use Illuminate\Http\Request;
use  App\Models\PortalPost_;
use Illuminate\Support\Facades\Crypt;
use Gate;

class Article extends \App\Http\Controllers\Controller
{
    public function audit(Request $request, $id)
    {
        $result = PortalPost_::auditPost($id,
            $request->input('status'),
            $request->input('reason', ''));
        return response()->json($result);
    }

    public function publishedArticleList(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];
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

    public function userArticleList(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];
        $list = PortalPost_::getUserPostList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'user_id' => &$filter['user_id'],
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

    public function auditUserArticleList(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];
        $list = PortalPost_::getAuditUserPostList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'audit_user_id' => &$filter['audit_user_id'],
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

    public function checkArticle($id)
    {
        try {
            $row = PortalPost_::checkPost($id, []);
            $result = ['success' => 1, 'data' => $row];
        } catch (\Exception $e) {
            $result = ['success' => 0, 'data' => null, 'msg' => '查询文章出错，文章未发布或未通过审核'];
        }

        return response()->json($result);
    }
}
