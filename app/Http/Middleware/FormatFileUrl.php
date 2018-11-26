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
        $response = $next($request);
        $originalResponse = $response->original;
        if (is_array($originalResponse)) {
            return response()->json($this->formatArray($originalResponse));
        }
        if (is_json($originalResponse)) {
            return response()->json($this->formatArray(json_decode($originalResponse, true)));
        }
        return $response;
    }

    private function formatArray(array $arr): array
    {
        foreach ($arr as $key => &$value) {
            if (is_array($value)) {
                $value = $this->formatArray($value);
            } elseif (is_string($key) && is_json($value)) {
                $value = json_encode($this->formatArray(json_decode($value, true)));
            } elseif (is_string($key) && is_string($value) && !empty($value)) {
                $value = $this->formatString($key, $value);
            }
        }
        return $arr;
    }

    private function formatString(string $key, string $str): string
    {
        switch ($key) {
            case 'url':
            case 'thumbnail_format':
            case 'thumbnail':
            case 'monitor_map_format':
            case 'image_url':
                if (!empty($str) && strpos($str, "http") === false) {
                    $result = env('FILE_URL') . $str;
                } else {
                    $result = $str;
                }
                break;
            default:
                $result = $str;
                break;
        }
        return $result;
    }
}
