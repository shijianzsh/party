<?php

namespace App\Models;

use DB;

class UserPayment_ extends UserPayment
{
    static public function getPaymentList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
//            'user_id' => 0,
//            'to_user_id' => 0,
        ],
        array $with = []
    ): array
    {
        $Obj = UserPayment::with(array_merge($with,['user'=>function($query){
            $query->with(['department']);
        }]));

        $total = $Obj->count();

        if ($currentPage) {
            $pageSize = !$pageSize ? self::PAGE_SIZE : $pageSize;
        } else {
            $pageSize = 0;
        }
        if ($currentPage && $pageSize) {
            $offset = ($currentPage - 1) * $pageSize;
            $Obj->offset($offset)->limit($pageSize);
        }

        $get = $Obj->get();

        return ['rows' => $get->toArray(),
            'pagination' => ['current' => $currentPage, 'pageSize' => $pageSize, 'total' => $total ?? 0]
        ];
    }

    static public function getPayment(int $PaymentId, array $with = []): array
    {
        return $Obj = UserPayment::with($with)->findOrFail($PaymentId)->toArray();
    }

    static public function createPayment(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'name' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $Obj = new Payment();
                $Obj->name = $requestData['name'];
                $Obj->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updatePayment(int $PaymentId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'name' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($PaymentId, $requestData) {
                $Obj = UserPayment::findOrFail($PaymentId);
                $Obj->name = $requestData['name'];
                $Obj->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deletePayment(int $PaymentId): array
    {
        return ['success' => UserPayment::destroy($PaymentId)];
    }
}
