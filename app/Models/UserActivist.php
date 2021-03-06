<?php

namespace App\Models;

class UserActivist extends _BaseModel
{
    const AUDIT_STATUS = [
        '未知状态' => 0,
        '未初审' => 1,
        '初审通过' => 2,
        '初审未通过' => 3,
        '约谈通过' => 4,
        '成为积极分子' => 5,
    ];

    protected $casts = [
        'user_excerpt' => 'json',
        'party_rewards_and_punishment_record' => 'json',
        'user_family_member' => 'json',
        'more' => 'json',
    ];
    protected $fillable = ['code', 'status', 'audit_user_id', 'recommend_user_id'];

    protected $appends = [
        'created_at_format',
        'updated_at_format',
        'audit_status_format',
        'audit_user_name_format',
        'chat_user_name_format',
        'recommend_user_name_format',
    ];

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function auditUser()
    {
        return $this->hasOne('App\Models\User', 'id', 'audit_user_id');
    }

    public function chatUser()
    {
        return $this->hasOne('App\Models\User', 'id', 'chat_user_id');
    }

    public function recommendUser()
    {
        return $this->hasOne('App\Models\User', 'id', 'recommend_user_id');
    }

    public function getAuditStatusFormatAttribute()
    {
        return array_flip(self::AUDIT_STATUS)[$this->audit_status];
    }

    public function getAuditUserNameFormatAttribute()
    {
        return !empty($this->auditUser) ? $this->auditUser->user_name : null;
    }

    public function getChatUserNameFormatAttribute()
    {
        return !empty($this->chatUser) ? $this->chatUser->user_name : null;
    }

    public function getRecommendUserNameFormatAttribute()
    {
        return !empty($this->recommendUser) ? $this->recommendUser->user_name : null;
    }
}
