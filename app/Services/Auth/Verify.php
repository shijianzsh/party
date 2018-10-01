<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/9/29
 * Time: 10:09 AM
 */

namespace App\Services\Auth;


trait Verify
{
    /**
     * 验证请求类型的合法性
     * @return string 小写的method
     */
    private function verifyMethod(string $method): string
    {
        $method = strtolower($method);

        if (!in_array($method, ['resource', 'get', 'post', 'put', 'patch', 'delete'])) {
            throw new \Exception('verifyMethod method error');
        }
        return $method;
    }

    /**
     * 格式化path
     * @return string 格式化后的path
     */
    private function formatPath(string $path): string
    {
        if (empty($path)) {
            throw new \Exception('verifyMethod formatPath error');
        }

        $path = str_replace("/", "|", $path);
        $temp = explode('|', $path);

        for ($i = 0; $i < count($temp); $i++) {
            $pregs = '/\{|\}/';
            $str = $temp[$i];
            if (preg_match($pregs, $str)) {
                $temp[$i] = '?';
            }
        }
        return implode("|", $temp);
    }

    /**
     * 验证单个auth verifyAuths的子方法
     */
    private function verifyAuth(string $method, string $path, array $auth): bool
    {
        $method = $this->verifyMethod($method);
        $path = $this->formatPath($path);

        if ($auth['path_format'] !== $path) {
            return false;
        }

        if ($method !== 'resource' && $method !== $auth['method']) {
            return false;
        }

        return true;
    }

    /**
     * 验证auths中是否包含当前传入的path
     */
    public function verifyAuths(string $method, string $path, array $auths):bool
    {
        if (empty($auths)) return false;

        for ($i = 0; $i < count($auths); $i++) {
            $verifyAuth = $this->verifyAuth($method, $path, $auths[$i]);
            if ($verifyAuth) return true;
        }

        return false;
    }
}
