<?php

namespace App\Http\Middleware;

use Closure;
use App\Services\Token\AccessToken;
use Illuminate\Support\Facades\Response;

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
        } catch (\Exception $e) {
            $verify = ['success' => 0, 'msg' => $e->getMessage()];
            return response()->json($verify);
        }
        if (!$verify['success']) {
            return $next($request);

            //TODO 跨域header为空
        }

        return $next($request);
    }
}
