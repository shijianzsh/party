<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Response;
use App\Services\Auth\Auth;
use App\Models\User_;

class VerifyAuth
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
        try {
            $verifyAuth = Auth::init()->verify($request->method(), $request->path());
            if (!$verifyAuth) {
                throw new \Exception('权限不足');
            }

        } catch (\Exception $e) {
            $verify = ['success' => 0, 'msg' => $e->getMessage()];
            return response()->json($verify);
        }

        return $next($request);
    }
}
