<?php

namespace App\Http\Middleware;

use Closure;
use App\Services\Token\Token;
use App\Services\Socket;
use App\Services\Socket\Helper\RequestHelper;

class VerifyIsSocketServer
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
        if (!RequestHelper::verifyEncryptionParams($request->input())) {
            return response()->json(['success' => 0, 'message' => 'socket server request verify error']);
        }

        return $next($request);
    }
}
