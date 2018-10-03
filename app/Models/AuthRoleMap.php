<?php

namespace App\Models;

/**
 * 权限role-map中间表
 */
class AuthRoleMap extends _BaseModel
{
    protected $fillable = ['auth_role_id', 'auth_map_id'];
}
