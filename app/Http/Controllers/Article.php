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
        //TODO 留言信息增加审核人 增加敏感字段筛选 维护map
        //TODO 在线考试增加自测功能 模拟开始
        //TODO 支付参数按照单位来设置
        //TODO 没做的模块先放ui
        $result = PortalPost_::auditPost($id,
            $request->input('status'),
            $request->input('reason', ''));
        return response()->json($result);
    }

    public function publishedArticleList(Request $request)
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

    public function userArticleList(Request $request)
    {
        $filter = json_decode($request->query('filter') ? $request->query('filter') : [], true);
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
        $filter = json_decode($request->query('filter') ? $request->query('filter') : [], true);
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
        $row = PortalPost_::checkPost($id, []);

        $result = ['success' => 1, 'data' => $row];
        return response()->json($result);
    }
}
