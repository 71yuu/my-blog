package com.yuu.blog.dao;

import com.yuu.blog.pojo.Tag;

import java.util.List;

/**
 * 标签 Mapper
 *
 * @Classname TagMapper
 * @Date 2019/1/7 15:04
 * @Created by Yuu
 */
public interface TagMapper {

    /**
     * 获取标签列表
     *
     * @return
     */
    List<Tag> listTag();

    /**
     * 添加标签
     *
     * @param tag
     */
    void insertTag(Tag tag);

    /**
     * 修改标签
     *
     * @param tag 标签
     */
    void updateTag(Tag tag);

    /**
     * 删除标签
     *
     * @param id 标签 ID
     */
    void deleteTag(Integer tagId);

    /**
     * 根据标签 ID 获取标签
     *
     * @param id 标签 ID
     * @return
     */
    Tag getTag(Integer id);

    /**
     * 获取标签总数
     *
     * @return
     */
    int countTag();
}
