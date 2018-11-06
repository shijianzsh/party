<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/9/29
 * Time: 9:23 AM
 */

namespace App\Services\Auth;

use App\Models\User_, App\Models\AuthMap_, App\Models\AuthRole_;
use Illuminate\Http\Request;
use DB, Cache;

class Auth
{
    use Verify;

    private $userId;
    private $request;

    public function __construct()
    {
        $this->request = new Request();
    }

    static public function init(int $userId = 0): Auth
    {
        $Obj = new Auth();
        $Obj->userId = $userId;
        return $Obj;
    }

    private function getUserId(): int
    {
        return $this->userId ? $this->userId : User_::getMyId();
    }

    public function getAuths(): array
    {
        $userId = $this->getUserId();

        return AuthMap_::getUserAuth($userId);
    }

    public function verify(string $method, string $path): bool
    {
        $requestMethod = strtolower($this->request->method());

        return $this->verifyAuths($requestMethod, $path, $this->getAuths());
    }
}
