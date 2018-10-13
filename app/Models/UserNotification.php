<?php

namespace App\Models;

class UserNotification extends _BaseModel
{
    //关联的类型 涉及到array_flip故value不可重复
    const RELATED_TYPE = ['未知类型' => 0, '文章' => 1, '会议' => 2, '留言' => 3, '党支部活动' => 4];

    //操作的类型 涉及到array_flip故value不可重复
    const OPERATE_TYPE = ['未知类型' => 0, '查看' => 1, '审核' => 2, '参加' => 3, '审核通过' => 4];

    protected $appends = [
        'related_type_format',
        'operate_type_format',
        'title_format',
        'description_format',
        'created_at_format',
        'updated_at_format',
    ];

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function getRelatedTypeFormatAttribute()
    {
        $arr = array_flip(self::RELATED_TYPE);
        return array_key_exists($this->related_type, $arr) ? $arr[$this->related_type] : '错误的类型';
    }

    public function getOperateTypeFormatAttribute()
    {
        $arr = array_flip(self::OPERATE_TYPE);
        return array_key_exists($this->operate_type, $arr) ? $arr[$this->operate_type] : '错误的类型';
    }

    public function getTitleFormatAttribute()
    {
        try {
            switch ($this->related_type) {
                case self::RELATED_TYPE['文章']:
                    return PortalPost_::getPost($this->related_id)['post_title'];
                case self::RELATED_TYPE['会议']:
                    return Meeting_::getMeeting($this->related_id)['title'];
                case self::RELATED_TYPE['留言']:
                    return UserComment_::getComment($this->related_id)['comment_title'];
                default:
                    return '错误的类型';
            }
        } catch (\Exception $e) {
            return '查询对应项目失败';
        }
    }

    public function getDescriptionFormatAttribute()
    {
        switch ($this->operate_type) {
            case self::OPERATE_TYPE['查看']:
                $msg = "请 {$this->operate_type_format}";
                break;
            case self::OPERATE_TYPE['审核']:
                $msg = "需要您进行 {$this->operate_type_format} 操作";
                break;
            case self::OPERATE_TYPE['参加']:
                $msg = "需要您 {$this->operate_type_format}";
                break;
            case self::OPERATE_TYPE['审核通过']:
                $msg = "已经 {$this->operate_type_format}";
                break;
            default:
                $msg = "错误的操作类型";
                break;
        }
        return $msg;
    }
}
