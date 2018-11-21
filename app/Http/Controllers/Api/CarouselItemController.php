<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\PortalCarouselItem_;

class CarouselItemController extends \App\Http\Controllers\Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];
        $list = PortalCarouselItem_::getCarouselItemList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'carousel_id' => &$filter['carousel_id'],
                'keyword' => &$filter['keyword'],
                'visible' => &$filter['visible'],
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
        $result = PortalCarouselItem_::createCarouselItem($request->input('data'));
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
        $list = PortalCarouselItem_::getCarouselItem($id);

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
        $result = PortalCarouselItem_::updateCarouselItem($id, $request->input('data'));
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
        return response()->json(PortalCarouselItem_::deleteCarouselItem($id));
    }
}
