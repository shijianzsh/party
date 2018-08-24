<?php

namespace App\Http\Controllers;

use App\Models\PortalPost;
use Illuminate\Http\Request;
use  App\Models\PortalPost_;
use Illuminate\Support\Facades\Crypt;

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
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //TODO
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //TODO
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
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //TODO
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
        //TODO
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
