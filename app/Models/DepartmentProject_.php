<?php

namespace App\Models;

class DepartmentProject_ extends DepartmentProject
{
    static public function getProjectList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'department_id' => null,
            'keyword' => null,
            'start_timestamp' => null,
            'end_timestamp' => null,
        ],
        array $with = []
    ): array
    {
        $department_id =& $filter['department_id'];
        $keyword =& $filter['keyword'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = DepartmentProject::with($with);

        if (!empty($department_id)) {
            $Obj->where('department_id', $department_id);
        }

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('title', 'like', "%{$keyword}%")
                    ->orWhere('content', 'like', "%{$keyword}%");
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
            $pageSize = !$pageSize ? DepartmentProject::PAGE_SIZE : $pageSize;
        } else {
            $pageSize = 0;
        }
        if ($currentPage && $pageSize) {
            $offset = ($currentPage - 1) * $pageSize;
            $Obj->offset($offset)->limit($pageSize);
        }

        $get = $Obj->get()->toArray();

        for ($i = 0; $i < count($get); $i++) {
            $row =& $get[$i];
            unset($row['audit_user']);
            unset($row['initiate_user']);
        }

        return [
            'rows' => $get,
            'pagination' => getPagination($currentPage, $pageSize, $total)
        ];
    }

    static public function getProject(int $projectId, bool $getObject = false, array $with = [])
    {
        $Obj = DepartmentProject::with($with)->findOrFail($projectId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    static public function createProject(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
//            'department_id' => 'required',
//            'initiate_user_id' => 'required',
            'audit_user_id' => 'required',
            'title' => 'required',
            'content' => 'required',
            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new DepartmentProject();
            $Obj->department_id = Department_::getMyId();
            $Obj->initiate_user_id = User_::getMyId();
            $Obj->audit_user_id = $requestData['audit_user_id'];
            $Obj->audit_status = DepartmentProject::AUDIT_STATUS['未审核'];
            $Obj->title = $requestData['title'];
            $Obj->content = $requestData['content'];
            $Obj->more = [
                'files' => $requestData['more_files'] ?? '',
            ];
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateProject(int $projectId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'title' => 'required',
            'content' => 'required',
            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = DepartmentProject::findOrFail($projectId);
            $Obj->title = $requestData['title'];
            $Obj->content = $requestData['content'];
            $Obj->more = [
                'files' => $requestData['more_files'] ?? '',
            ];
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteProject(int $projectId): array
    {
        try {
            $Obj = DepartmentProject::with(['children', 'users'])->findOrFail($projectId);

            $Obj->steps()->operateHistories()->delete();
            $Obj->steps()->delete();
            $Obj->delete();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

}
