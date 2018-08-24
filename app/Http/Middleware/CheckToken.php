<?php

namespace App\Http\Middleware;

use Closure;
use App\Services\Token\Token;

class CheckToken
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
        $AccessTokenObj = new Token();
        $verify = $AccessTokenObj->verify($request->input('token',''));
        if (!$verify['success']) {
            return response()->json($verify);
        }

        return $next($request);
    }
}
