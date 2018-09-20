<?php

namespace App\Http\Controllers;

use App\Models\PortalPost;
use Illuminate\Http\Request;
use  App\Models\PortalPost_;
use Illuminate\Support\Facades\Crypt;
use Gate;

class ArticleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'),true): [];
        $list = PortalPost_::getPostList(
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

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $result = PortalPost_::createPost($request->input('data'));
        return response()->json($result);
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $row = PortalPost_::getPost($id, []);

        $result = ['success' => 1, 'data' => $row];
        return response()->json($result);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     */
    public function update(Request $request, $id)
    {
        $result = PortalPost_::updatePost($id, $request->input('data'));
        return response()->json($result);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return response()->json(PortalPost_::deletePost($id));
    }
}
