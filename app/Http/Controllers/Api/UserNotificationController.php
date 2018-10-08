<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use  App\Models\UserNotification_;
use Illuminate\Support\Facades\Crypt;
use Gate, Cache;

class UserNotificationController extends \App\Http\Controllers\Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];

        $list = UserNotification_::getNotificationList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'user_id' => &$filter['user_id'],
                'related_type' => &$filter['related_type'],
                'is_checked' => &$filter['is_checked'],
            ]
        );

        $result = ['success' => 1, 'data' => $list, '$request' => $request->query(), '$filter' => $filter];
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
        $row = UserNotification_::checkNotification($id, []);

        $result = ['success' => 1, 'data' => $row];
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
        return response()->json(UserNotification_::deleteNotification($id));
    }
}
