<?php

namespace App\Models;

use DB;

class PortalCarouselItem_ extends PortalCarouselItem
{
    static public function getCarouselItemList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'carousel_id' => null,
            'keyword' => null,
            'is_visible' => null,
        ],
        array $with = []
    ): array
    {
        $carousel_id =& $filter['carousel_id'];
        $keyword =& $filter['keyword'];
        $is_visible =& $filter['is_visible'];

        $Obj = PortalCarouselItem::with($with);
        $Obj->orderBy('sort_order', 'asc');

        if (!empty($carousel_id)) {
            $Obj->where('carousel_id', $carousel_id);
        }
        
        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('title', 'like', "%{$keyword}%");
            });
        }

        if ($is_visible !== null) {
            $Obj->where('is_visible', $is_visible);
        }

        $total = $Obj->count();

        if ($currentPage) {
            $pageSize = !$pageSize ? PortalCarouselItem::PAGE_SIZE : $pageSize;
        } else {
            $pageSize = 0;
        }
        if ($currentPage && $pageSize) {
            $offset = ($currentPage - 1) * $pageSize;
            $Obj->offset($offset)->limit($pageSize);
        }

        $get = $Obj->get();

        return [
            'rows' => $get->toArray(),
            'pagination' => getPagination($currentPage, $pageSize, $total)
        ];
    }

    static public function getCarouselItem(int $carouselItemId, bool $getObject = false, array $with = [])
    {
        $Obj = PortalCarouselItem
            ::with(array_merge($with))
            ->findOrFail($carouselItemId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    static public function createCarouselItem(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'carousel_id' => 'required',
            'sort_order' => 'required',
            'title' => 'required',
            'image_url' => 'required',
            'href' => 'required',
            'is_visible' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new PortalCarouselItem();
            $Obj->carousel_id = $requestData['carousel_id'];
            $Obj->sort_order = $requestData['sort_order'];
            $Obj->title = $requestData['title'];
            $Obj->image_url = $requestData['image_url'];
            $Obj->href = $requestData['href'];
            $Obj->is_visible = $requestData['is_visible'];
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateCarouselItem(int $carouselItemId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'sort_order' => 'required',
            'title' => 'required',
            'image_url' => 'required',
            'href' => 'required',
            'is_visible' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = PortalCarouselItem::findOrFail($carouselItemId);
            $Obj->sort_order = $requestData['sort_order'];
            $Obj->title = $requestData['title'];
            $Obj->image_url = $requestData['image_url'];
            $Obj->href = $requestData['href'];
            $Obj->is_visible = $requestData['is_visible'];
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteCarouselItem(int $carouselItemId): array
    {
        try {
            DB::transaction(function () use ($carouselItemId) {
                $Obj = PortalCarouselItem::findOrFail($carouselItemId);
                $Obj->delete();
            });

        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }
}
