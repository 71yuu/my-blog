package com.yuu.blog.service;

import com.yuu.blog.pojo.Tag;

import java.util.List;

/**
 * 标签 Service
 *
 * @Classname TagService
 * @Date 2019/1/7 14:53
 * @Created by Yuu
 */
public interface TagService {

    /**
     * 获取标签列表
     *
     * @return
     */
    List<Tag> listTag();

    /**
     * 获取标签列表和每个标签的文章数量
     *
     * @return
     */
    List<Tag> listTagWithCount();

    /**
     * 添加或编辑标签
     *
     * @param tag 标签
     */
    void insertTag(Tag tag);

    /**
     * 获取标签的文章数量
     *
     * @param id 标签 ID
     * @return
     */
    Integer countArticleByTagId(Integer id);

    /**
     * 删除标签
     *
     * @param id 标签 ID
     */
    void deleteTag(Integer id);

    /**
     * 根据 ID 获取标签信息
     *
     * @param id 标签 ID
     * @return
     */
    Tag getTagById(Integer id);

    /**
     * 获取标签总数
     *
     * @return
     */
    int countTag();
}
