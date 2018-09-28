<?php

namespace App\Models;

/**
 * 权限角色表 主表
 */
class AuthRole extends _BaseModel
{
    /**
     * 中间表-拥有的权限
     */
    public function authMiddle()
    {
        return $this->hasMany('App\Models\AuthRoleMap', 'auth_role_id');
    }

    /**
     * 拥有的权限
     */
    public function auths()
    {
        return $this->hasManyThrough(
            'App\Models\AuthMap',
            'App\Models\AuthRoleMap',
            'auth_role_id',
            'id',
            'id',
            'auth_map_id'
        );
    }

    /**
     * 中间表-拥有的user
     */
    public function userMiddle()
    {
        return $this->hasMany('App\Models\AuthRoleUser', 'auth_role_id');
    }

    /**
     * 拥有的user
     */
    public function users()
    {
        return $this->hasManyThrough(
            'App\Models\User',
            'App\Models\AuthRoleUser',
            'auth_role_id',
            'id',
            'id',
            'user_id'
        );
    }
}
