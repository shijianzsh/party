<?php

namespace App\Models;

use DB;

class PortalCarousel_ extends PortalCarousel
{
    static public function getCarouselList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'keyword' => null,
            'is_visible' => null,
        ],
        array $with = []
    ): array
    {
        $keyword =& $filter['keyword'];
        $is_visible =& $filter['is_visible'];

        $Obj = PortalCarousel::with(array_merge($with, ['items' => function ($query) {
            $query->orderBy('sort_order', 'asc');
        }]));

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('title', 'like', "%{$keyword}%");
            });
        }

        if (!empty($is_visible)) {
            $Obj->where('is_visible', $is_visible);
        }

        $total = $Obj->count();

        if ($currentPage) {
            $pageSize = !$pageSize ? PortalCarousel::PAGE_SIZE : $pageSize;
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

    static public function getCarousel(int $carouselId, bool $getObject = false, array $with = [])
    {
        $Obj = PortalCarousel
            ::with(array_merge($with, ['items' => function ($query) {
                $query->orderBy('sort_order', 'asc');
            }]))
            ->findOrFail($carouselId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    static public function createCarousel(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'title' => 'required',
            'is_visible' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new PortalCarousel();
            $Obj->title = $requestData['title'];
            $Obj->is_visible =$requestData['is_visible'];
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateCarousel(int $carouselId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'title' => 'required',
            'is_visible' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }
            $Obj = PortalCarousel::findOrFail($carouselId);
            $Obj->title = $requestData['title'];
            $Obj->is_visible =$requestData['is_visible'];
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteCarousel(int $carouselId): array
    {
        try {
            DB::transaction(function () use ($carouselId) {
                $Obj = PortalCarousel::with(['items'])->findOrFail($carouselId);
                $Obj->items()->delete();
                $Obj->delete();
            });

        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }
}
