<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UserPayment_, App\Models\PortalPost_;

class UserPaymentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'),true): [];
        $list = UserPayment_::getPaymentList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
//                'user_id' => &$filter['user_id'],
//                'to_user_id' => &$filter['to_user_id'],
            ]
        );

        $result = ['success' => 1, 'data' => $list, '$request' => $request];
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
        $result = UserPayment_::createPayment($request->input('data'));
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
        $list = UserPayment_::getPayment(
            $id,  []
        );

        $result = ['success' => 1, 'data' => $list];
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
        $result = UserPayment_::updatePayment($id,$request->input('data'));
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
        return response()->json(UserPayment_::deletePayment($id));
    }
}
