<?php

namespace App\Http\Middleware;

use Closure;
use App\Services\Token\Token;

class VerifyToken
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
        $token = $request->input('token', '');
        if (empty($token)) {
            return response()->json(['success' => 0, 'msg' => 'verify token middleware token null error']);
        }
//        if ($token === 'api_test_token') return $next($request);

        $TokenObj = new Token();
        $verify = $TokenObj->verify($token);
        if (!$verify['success']) {
            return response()->json($verify);
        }

        return $next($request);
    }
}
