<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Response;
use App\Services\Auth\Auth;
use App\Models\User_;

class FormatFileUrl
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
        //TODO 写入
//        dump($request);
//        exit;
        $response = $next($request);
        return response()->json($this->formatArray($response->original));
    }

    private function formatArray(array $arr): array
    {
        foreach ($arr as $key => &$value) {
            if (is_array($value)) {
                $value = $this->formatArray($value);
            }
            if (is_string($value) && !empty($value)) {
                $value = $this->formatString($key, $value);
            }
        }
        return $arr;
    }

    private function formatString($key, string $str): string
    {
        //TODO 待完善
        switch ($key) {
            case 'url':
            case 'thumbnail_format':
            case 'thumbnail':
                $result = env('FILE_URL') . $str;
                break;
            default:
                $result = $str;
        }
        return $result;
    }
}
