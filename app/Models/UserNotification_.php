<?php

namespace App\Models;

use App\Services\Notification\Pusher;
use DB;

class UserNotification_ extends UserNotification
{
    static public function getNotificationList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'user_id' => null,
            'related_type' => null,
            'is_checked' => null,
        ],
        array $with = []
    ): array
    {
        $user_id =& $filter['user_id'];
        $related_type =& $filter['related_type'];
        $is_checked =& $filter['is_checked'];

        $Obj = UserNotification::with($with);

        $Obj->orderBy('is_checked', 'asc');

        if (!empty($user_id)) {
            $Obj->where('user_id', $user_id);
        }

        if (!empty($related_type)) {
            $Obj->where('related_type', $related_type);
        }

        if (!empty($is_checked)) {
            $Obj->where('is_checked', $is_checked);
        }

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

    static public function getUserUnreadNotificationBadgeCount(int $userId): array
    {
        try {
            $get = UserNotification
                ::where('user_id', $userId)
                ->where('is_checked', 0)
                ->get()
                ->toArray();

            $count = [];
            for ($i = 0; $i < count($get); $i++) {
                $row = $get[$i];
                $related_type = $row['related_type'];

                if (!array_key_exists($related_type, $count)) {
                    $count[$related_type] = 0;
                }
                $count[$related_type]++;
            }

            $map = array_flip(self::RELATED_TYPE);
            unset($map[0]);

            $data = [
                'map' => $map,
                'count' => $count
            ];

        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $data ?? null];
    }

    static public function getNotification(int $notificationId, array $with = []): array
    {
        $Obj = UserNotification::with($with)->findOrFail($notificationId);
        return $Obj->toArray();
    }

    static public function checkNotification(int $notificationId, array $with = []): array
    {
        $Obj = UserNotification::with($with)->findOrFail($notificationId);
        if (!$Obj->is_checked) {
            $Obj->is_checked = 1;
            $Obj->save();
        }
        return $Obj->toArray();
    }

    static public function createNotification(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'user_id' => 'required',
            'related_type' => 'required',
            'related_id' => 'required',
            'operate_type' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $notification_id = 0;

            DB::transaction(function () use ($requestData, &$notification_id) {
                $Obj = new UserNotification();
                $Obj->user_id = $requestData['user_id'];
                $Obj->related_type = $requestData['related_type'];
                $Obj->related_id = $requestData['related_id'];
                $Obj->operate_type = $requestData['operate_type'];
                $Obj->save();

                $notification_id = $Obj->id;
            });

            Pusher::send($notification_id);
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteNotification(int $notificationId): array
    {
        return ['success' => UserNotification::destroy($notificationId)];
    }
}
