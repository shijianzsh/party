<?php

namespace App\Models;

class AuthMap_ extends AuthMap
{
    static public function getUserAuth(int $userId)
    {
        $get = AuthRole::with(['userMiddle', 'auths'])
            ->whereHas('userMiddle', function ($query) use ($userId) {
                $query->where('auth_role_user.user_id', $userId);
            })
            ->get()
            ->toArray();

        $temp = array_column($get, 'auths');

        $result = [];
        for ($i = 0; $i < count($temp); $i++) {
            for ($j = 0; $j < count($temp[$i]); $j++) {
                $result[$temp[$i][$j]['id']] = $temp[$i][$j];
            }
        }

        return array_values($result);
    }
}
