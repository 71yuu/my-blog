package com.yuu.blog.dao;

import com.yuu.blog.pojo.ArticleCategoryRef;
import com.yuu.blog.pojo.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 文章分类关联表 Mapper
 *
 * @Classname ArticleCategoryRefMapper
 * @Date 2019/1/7 10:35
 * @Created by Yuu
 */
@Repository
public interface ArticleCategoryRefMapper {

    /**
     * 根据文章 ID 获取分类列表
     *
     * @param articleId 文章 ID
     * @return 分类列表
     */
    List<Category> listCategoryByArticleId(Integer articleId);

    /**
     * 添加文章和分类关联记录
     *
     * @param articleCategoryRef 关联对象
     */
    void insert(ArticleCategoryRef articleCategoryRef);

    /**
     *  删除文章与分类之间的关系
     *
     * @param articleId 文章 ID
     */
    void deleteByCategoryId(Integer articleId);

    /**
     * 根据分类 ID 统计文章数
     *
     * @param categoryId 分类 ID
     * @return 文章数量
     */
    Integer countArticleByCategoryId(Integer categoryId);

    /**
     * 查询文章相关分类
     *
     * @param articleId 分类 ID
     * @return
     */
    List<Integer> selectCategoryIdByArticleId(Integer articleId);

    /**
     * 删除文章，删除分类文章
     *
     * @param id 文章 ID
     */
    void deleteByArticleId(Integer articleId);
}
