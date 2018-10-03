<?php

namespace App\Models;

/**
 * 权限role-user中间表
 */
class AuthRoleUser extends _BaseModel
{
    protected $fillable = ['auth_role_id', 'user_id'];
}
