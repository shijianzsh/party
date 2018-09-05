<?php

namespace App\Models;

class UploadFileLog_ extends UploadFileLog
{
    static public function getUploadFileLogList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            '' => "",
        ],
        array $with = []
    ): array
    {
        $Obj = UploadFileLog::with($with);

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

        return ['rows' => $get->toArray(), 'pagination' => ['current' => $currentPage, 'pageSize' => $pageSize, 'total' => $total ?? 0]];
    }

    static public function create(string $url): array
    {
        if (empty($url)) {
            $success = 0;
            goto end;
        }

        $Obj = new UploadFileLog;
        $Obj->user_id = User_::getMyId();
        $Obj->url = $url;
        $success = $Obj->save();

        end:
        return ['success' => (int)($success ?? 1), 'data' => $url];
    }
}
