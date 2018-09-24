<?php

namespace App\Http\Middleware;

use Closure;
use App\Services\Token\AccessToken;
use Illuminate\Support\Facades\Response;
use App\Models\User_;

class CheckAccessToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $AccessTokenObj = new AccessToken();

        try {
            $verify = $AccessTokenObj->verifyAndSetToSession($request->input('access_token', ''));
            if (!$verify['success']) {
                return response()->json($verify);
            }

            if (User_::getMyId() === 0) {
                throw new \Exception('access_token获取user_id失败');
            }
        } catch (\Exception $e) {
            $verify = ['success' => 0, 'msg' => $e->getMessage()];
            return response()->json($verify);
        }

        return $next($request);
    }
}
