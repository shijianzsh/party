<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/9/28
 * Time: 12:32 AM
 */

/**
 * 内容页中通过post或post_id获取url
 *
 * @param  array int $post
 * @return string
 */
function getPostUrl($post): string
{
    if (is_array($post)) {
        $id = $post['id'];
    } elseif (is_numeric($post)) {
        $id = $post;
    } elseif (empty($post)) {
        return '#';
    } else {
        throw new Exception('getPostUrl param type error');
    }

    return "/index/post/{$id}";
}

/**
 * 内容页中通过category或category_id获取url
 *
 * @param  array int $category
 * @return string
 */
function getCategoryUrl($category): string
{
    if (is_array($category)) {
        $id = $category['id'];
    } elseif (is_numeric($category)) {
        $id = $category;
    } elseif (empty($category)) {
        return '#';
    } else {
        throw new Exception('getCategoryUrl param type error');
    }

    return "/index/category/{$id}";
}

/**
 * 通过category_id获取发布的且通过审核逻辑的文章
 *
 * @param
 * @return array
 */
function getCategoryPublishedPostList(int $categoryId, int $postNumber = 0): array
{
    return \App\Models\PortalPost_::getCategoryPublishedPostList($categoryId, $postNumber);
}
