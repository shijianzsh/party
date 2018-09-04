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
        $list = PortalPost_::getPostList(
            $request->input('curr_page', 0),
            $request->input('page_number', 0),
            [
                'categoryId' => $request->input('category_id'),
                'keyWord' => $request->input('keyWord'),
                'startTimestamp' => $request->input('start_timestamp'),
                'endTimestamp' => $request->input('end_timestamp'),
            ],
            []
        );

        $result = ['success' => 1, 'data' => $list];
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
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $result = PortalPost_::updatePost($id,$request->input('data'));
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
