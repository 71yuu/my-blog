package com.yuu.blog.service;

import com.github.pagehelper.PageInfo;
import com.yuu.blog.pojo.Article;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文章 Service
 *
 * @Classname ArticleService
 * @Date 2019/1/6 22:40
 * @Created by Yuu
 */
public interface ArticleService {

    /**
     * 获取文章总数
     *
     * @param status 状态
     * @return 数量
     */
    Integer countArticle(Integer status);

    /**
     * 获取最新文章
     *
     * @param limit 查询数量
     * @return 文章列表
     */
    List<Article> listRecentArticle();

    /**
     * 添加新文章
     *
     * @param article 文章
     */
    void insertArticle(Article article);

    /**
     * 分页显示
     *
     * @param pageIndex 第几页开始
     * @param pageSize 一页显示多少
     * @param criteria 查询条件
     * @return 文章列表
     */
    PageInfo<Article> pageArticle(Integer pageIndex, Integer pageSize, Map<String, Object> criteria);

    /**
     * 删除文章
     *
     * @param id 文章 ID
     */
    void deleteArticle(Integer id);

    /**
     * 根据 ID 查询文章
     *
     * @param status 文章状态
     * @param id 文章 ID
     * @return
     */
    Article getArticleByStatusAndId(Integer status, Integer id);

    /**
     * 查询分类的文章数
     *
     * @param id 分类 ID
     * @return
     */
    int countArticleByCategoryId(Integer id);

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
    Article getLastUpdateArticle();

    /**
     * 查询文章相关分类的文章 ID
     *
     * @param articleId 文章 ID
     * @return
     */
    List<Integer> listCategoryIdByArticleId(Integer articleId);

    /**
     * 根据分类列表获取文章列表
     *
     * @param categoryIds 分类 ids
     * @param  limit 获取文章个数
     * @return
     */
    List<Article> listArticleByCategoryIds(List<Integer> categoryIds, int limit);

    /**
     * 获取查看数量最多的文章
     *
     * @param limit 查询个数
     * @return
     */
    List<Article> listArticleByViewCount(int limit);

    /**
     * 根据 ID 获取下一篇文章
     *
     * @param articleId 文章 ID
     * @return
     */
    Article getAfterArticle(Integer articleId);

    /**
     * 根据 ID 获取上一篇文章
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
     * 获取最新更新的文章
     *
     * @param i 文章数量
     * @return
     */
    List<Article> newArticleList(int i);
}
