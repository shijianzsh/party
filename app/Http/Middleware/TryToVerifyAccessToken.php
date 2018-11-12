<?php

namespace App\Http\Middleware;

use Closure;
use App\Services\Token\AccessToken;
use Illuminate\Support\Facades\Response;
use App\Models\User_;

class TryToVerifyAccessToken
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
            $AccessTokenObj->verifyAndSetToSession($request->input('access_token', ''));
        } catch (\Exception $e) {

        } finally {
            return $next($request);
        }
    }
}
