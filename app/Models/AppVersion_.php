<?php

namespace App\Models;

class AppVersion_ extends AppVersion
{
    static public function getVersionList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'keyword' => null,
            'start_timestamp' => null,
            'end_timestamp' => null,
        ],
        array $with = []
    ): array
    {
        $keyword =& $filter['keyword'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = AppVersion::with($with);

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('version', 'like', "%{$keyword}%")
                    ->orWhere('code', 'like', "%{$keyword}%")
                    ->orWhere('log', 'like', "%{$keyword}%");
            });
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
            'pagination' =>getPagination($currentPage, $pageSize, $total)
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
            'url' => 'required',
            'log' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new Version();
            $Obj->parent_id = $requestData['parent_id'] ?? 0;
            $Obj->name = $requestData['name'];
            $Obj->introduce = $requestData['introduce'] ?? '';
            $Obj->location = $requestData['location'] ?? '';
            $Obj->coordinate_x = $requestData['coordinate_x'] ?? '';
            $Obj->coordinate_y = $requestData['coordinate_y'] ?? '';
            $Obj->telphone = $requestData['telphone'] ?? '';
            $Obj->cellphone = $requestData['cellphone'] ?? '';
            $Obj->secretary = $requestData['secretary'] ?? '';
            $Obj->established_at = $requestData['established_at'] ?? '';
            $Obj->path = null;
            $Obj->more = [
                'thumbnail' => $requestData['more_thumbnail'] ?? '',
                'monitor_map' => $requestData['more_monitor_map'] ?? ''
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
            'parent_id' => '',
            'name' => 'required',
            'introduce' => '',
            'location' => '',
            'coordinate_x' => '',
            'coordinate_y' => '',
            'telphone' => '',
            'cellphone' => '',
            'secretary' => '',
            'established_at' => '',
            'more_thumbnail' => '',
            'more_monitor_map' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = AppVersion::findOrFail($versionId);
            $Obj->parent_id = $requestData['parent_id'] ?? 0;
            $Obj->name = $requestData['name'];
            $Obj->introduce = $requestData['introduce'] ?? '';
            $Obj->location = $requestData['location'] ?? '';
            $Obj->coordinate_x = $requestData['coordinate_x'] ?? '';
            $Obj->coordinate_y = $requestData['coordinate_y'] ?? '';
            $Obj->telphone = $requestData['telphone'] ?? '';
            $Obj->cellphone = $requestData['cellphone'] ?? '';
            $Obj->secretary = $requestData['secretary'] ?? '';
            $Obj->established_at = $requestData['established_at'] ?? '';
            $Obj->path = null;
            $Obj->more = [
                'thumbnail' => $requestData['more_thumbnail'] ?? '',
                'monitor_map' => $requestData['more_monitor_map'] ?? ''
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
            $Obj = AppVersion::with(['children', 'users'])->findOrFail($versionId);
            if (!$Obj) {
                throw new \Exception('deleteVersion Obj null error');
            }

            if (count($Obj->children)) {
                throw new \Exception('拥有子级单位，无法删除！');
            }

            if (count($Obj->users)) {
                throw new \Exception('拥有用户，无法删除！');
            }

            $Obj->delete();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

}
