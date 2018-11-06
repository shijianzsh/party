<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/11/5
 * Time: 10:56 PM
 */

namespace App\Models;

use DB;

class UserActivist_ extends User
{
    static public function getActivist(int $id)
    {
        return User
            ::with(['partyExperience', 'partyRelations', 'activist'])
            ->where('type', self::TYPE['群众'])
            ->findOrFail($id)
            ->toArray();
    }

    static public function getActivistByCode(string $code)
    {
        return User
            ::with(['partyExperience', 'partyRelations', 'activist'])
            ->where('type', self::TYPE['群众'])
            ->where('code', $code)
            ->firstOrFail()
            ->toArray();
    }

    static public function createActivist(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'department_id' => 'required',
            'user_name' => 'required',
            'user_sex' => 'required',
            'user_birthplace' => 'required',
            'user_nation' => 'required',
            'user_cellphone' => 'required',
            'user_duty' => 'required',
            'user_excerpt' => 'required',
//            'user_login' => 'required',
//            'user_password' => 'required',
            'more_thumbnail' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $userId = null;
            DB::transaction(function () use (&$userId, $requestData) {
                $Obj = new User;
                $Obj->type = self::TYPE['群众'];

                $Obj->department_id = $requestData['department_id'];
                $Obj->user_name = $requestData['user_name'];
                $Obj->user_sex = $requestData['user_sex'];
                $Obj->user_birthplace = $requestData['user_birthplace'];
                $Obj->user_nation = $requestData['user_nation'];
                $Obj->user_cellphone = $requestData['user_cellphone'];
                $Obj->user_duty = $requestData['user_duty'];
                $Obj->user_excerpt = $requestData['user_excerpt'];

                $Obj->more = [
                    'thumbnail' => $requestData['more_thumbnail'] ?? null,
                ];
                $Obj->save();

                $activist = new UserActivist([
                    'code' => rand_str(),
                    'status' => self::ACTIVIST_STATUS['待审核'],
                    'audit_user_id' => $requestData['audit_user_id'],
                    'recommend_user_id' => $requestData['recommend_user_id'],
                ]);
                $Obj->activist()->save($activist);
                $userId = $Obj->id;

                createNotification([
                    'user_id' => $userId,
                    'related_type' => \App\Models\UserNotification::RELATED_TYPE['积极分子'],
                    'related_id' => $Obj->id,
                    'operate_type' => \App\Models\UserNotification::OPERATE_TYPE['注册成功'],
                ]);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $userId ?? null];
    }
}