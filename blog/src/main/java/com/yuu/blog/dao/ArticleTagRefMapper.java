package com.yuu.blog.dao;

import com.yuu.blog.pojo.ArticleTagRef;
import com.yuu.blog.pojo.Tag;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 文章标签关联表 Mapper
 *
 * @Classname ArticleTagRefMapper
 * @Date 2019/1/7 11:19
 * @Created by Yuu
 */
@Repository
public interface ArticleTagRefMapper {

    /**
     * 根据文章获得标签列表
     * @param articleId 文章 ID
     * @return 标签列表
     */
    List<Tag> listTagByArticleId(Integer articleId);

    /**
     * 添加文章与分类的关系
     *
     * @param articleTagRef 关系
     */
    int insert(ArticleTagRef articleTagRef);

    /**
     * 删除文章与标签之间的关系
     *
     * @param articleId 文章 ID
     */
    void deleteByArticleId(Integer articleId);

    /**
     * 获取每个标签有多少篇文章
     *
     * @param tagId
     * @return
     */
    Integer countArticleByTagId(Integer tagId);
}
