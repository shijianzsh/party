<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:43
 */

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Services\Token\Token as TokenModel, App\Services\Token\AccessToken as AccessTokenModel;
use App\Models\ExamUserCollectQuestion_;
use App\Models\Department_;

class ExamCollectQuestionController extends \App\Http\Controllers\Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'),true): [];
        $list = ExamUserCollectQuestion_::getCollectQuestionList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'keyword' => &$filter['keyword'],
                'user_id' => &$filter['user_id'],
                'paper_id' => &$filter['paper_id'],
                'start_timestamp' => &$filter['start_timestamp'],
                'end_timestamp' => &$filter['end_timestamp'],
            ],
            ['user']
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
        //TODO
//        return response()->json(UserActivist_::createActivist($request->input('data')));
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //TODO
//        $result = ['success' => 1, 'data' => UserActivist_::getActivist($id)];
//        return response()->json($result);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     */
    public function update(Request $request, $id)
    {
        //TODO
//        $result = PortalPost_::updatePost($id, $request->input('data'));
//        return response()->json($result);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return response()->json(ExamUserCollectQuestion_::deleteCollectQuestion($id));
    }
}
