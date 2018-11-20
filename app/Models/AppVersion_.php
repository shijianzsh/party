<?php

namespace App\Models;

class AppVersion_ extends AppVersion
{
    static public function getVersionList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'type' => null,
            'start_timestamp' => null,
            'end_timestamp' => null,
        ],
        array $with = []
    ): array
    {
        $type =& $filter['type'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = AppVersion::with($with);

        if (!empty($type)) {
            $Obj->where('type', $type);
        }

        if ($startTimestamp) {
            $Obj->where('created_at', '>=', $startTimestamp);
        }

        if ($endTimestamp) {
            $Obj->where('created_at', '<=', $endTimestamp);
        }

        $total = $Obj->count();

        if ($currentPage) {
            $pageSize = !$pageSize ? AppVersion::PAGE_SIZE : $pageSize;
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

    static public function getVersion(int $versionId, bool $getObject = false, array $with = [])
    {
        $Obj = AppVersion::with($with)->findOrFail($versionId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    static public function createVersion(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'type' => 'required',
            'version' => 'required',
            'code' => 'required',
            'more_file' => 'required',
            'log' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new AppVersion();
            $Obj->type = $requestData['type'];
            $Obj->version = $requestData['version'];
            $Obj->code = $requestData['code'];
            $Obj->log = $requestData['log'];
            $Obj->more = [
                'file' => $requestData['more_file'],
            ];
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateVersion(int $versionId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'type' => 'required',
            'version' => 'required',
            'code' => 'required',
            'more_file' => 'required',
            'log' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = AppVersion::findOrFail($versionId);
            $Obj->type = $requestData['type'];
            $Obj->version = $requestData['version'];
            $Obj->code = $requestData['code'];
            $Obj->log = $requestData['log'];
            $Obj->more = [
                'file' => $requestData['more_file'],
            ];
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteVersion(int $versionId): array
    {
        try {
            $Obj = AppVersion::findOrFail($versionId);
            $success = $Obj->delete();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function getLatestVersion(int $type)
    {
        try {
            $row = AppVersion::where('type', $type)
                ->orderBy('created_at', 'desc')
                ->first();
            if (empty($row)) throw new \Exception('查询失败，数据不存在');
            $data = $row->toArray();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $data ?? null];
    }
}
