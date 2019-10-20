package com.yuu.blog.dao;

import com.yuu.blog.pojo.Article;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Classname ArticleMapper
 * @Date 2019/1/6 22:53
 * @Created by Yuu
 */
@Repository
public interface ArticleMapper {

    /**
     * 获取文章的数量
     *
     * @param status 文章的状态
     * @return
     */
    Integer countArticle(Integer status);

    /**
     * 文章列表
     *
     * @return
     */
    List<Article> listArticle();

    /**
     * 已经发布的文章
     *
     * @param status 文章的状态
     * @param id 文章 id
     * @return
     */
    Article getArticleByStatusAndId(@Param("status") Integer status, @Param("id") Integer id);

    /**
     * 添加文章
     *
     * @param article 文章
     */
    int insert(Article article);


    /**
     * 获取所有的文章countArticleComment
     *
     * @param criteria 查询条件
     * @return
     */
    List<Article> findAll(Map<String, Object> criteria);

    /**
     * 删除文章
     *
     * @param id 文章 ID
     */
    void deleteById(Integer id);

    /**
     * 修改文章
     *
     * @param article 文章
     */
    void update(Article article);


    /**
     * 获取文章查看总数
     *
     * @return
     */
    int countArticleView();

    /**
     * 获取最后更新的文章
     *
     * @return
     */
    Article lastUpdateArticle();

    /**
     *根据分类 ID 查找文章
     *
     * @param categoryIds 分类 ID 集合
     * @param limit 查询数量
     * @return
     */
    List<Article> findArticleByCategoryIds(@Param("categoryIds") List<Integer> categoryIds, @Param("limit") int limit);

    /**
     *查看数量最多的文章
     *
     * @param limit 文章数量
     * @return
     */
    List<Article> listArticleByViewCount(int limit);

    /**
     * 根据 ID 获取上一篇文章
     *
     * @param articleId 文章 ID
     * @return
     */
    Article getAfterArticle(Integer articleId);

    /**
     * 根据 ID 获取下一篇文章
     *
     * @param articleId 文章 ID
     * @return
     */
    Article getPreArticle(Integer articleId);

    /**
     * 随机获取文章
     *
     * @param limit 文章的数量
     * @return
     */
    List<Article> listRandomArticle(int limit);

    /**
     * 获取文章更新的数量
     *
     * @param i 文章的数量
     * @return
     */
    List<Article> newArticleList(int i);
}
