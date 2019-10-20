package com.yuu.blog.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yuu.blog.common.ArticleCommentStatus;
import com.yuu.blog.dao.ArticleCategoryRefMapper;
import com.yuu.blog.dao.ArticleMapper;
import com.yuu.blog.dao.ArticleTagRefMapper;
import com.yuu.blog.pojo.*;
import com.yuu.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Classname ArticleServiceImpl
 * @Date 2019/1/6 22:50
 * @Created by Yuu
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private ArticleCategoryRefMapper articleCategoryRefMapper;

    @Autowired
    private ArticleTagRefMapper articleTagRefMapper;

    @Override
    public Integer countArticle(Integer status) {
        Integer count = 0;
        count = articleMapper.countArticle(status);
        return count;
    }

    @Override
    public List<Article> listRecentArticle() {
        return articleMapper.listArticle();
    }

    @Override
    public void insertArticle(Article article) {

        // 修改文章
        if (article.getArticleId() != null) {
            articleMapper.update(article);

            if (article.getTagList() != null) {
                // 删除标签和文章关联
                articleTagRefMapper.deleteByArticleId(article.getArticleId());

                // 添加标签与文章关联
                addArticleTag(article);
            }

            if (article.getCategoryList() != null) {
                // 删除分类和文章关联
                articleCategoryRefMapper.deleteByCategoryId(article.getArticleId());

                // 添加分类与文章关联
                addArticleCategory(article);
            }
        }

        // 添加文章
        else {
            article.setArticleIsComment(ArticleCommentStatus.ALLOW.getValue());
            articleMapper.insert(article);
            addArticleTag(article);
            addArticleCategory(article);
        }
    }

    /**
     * 添加标签与文章关系
     *
     * @param article 文章
     */
    private void addArticleTag(Article article) {
        if (article.getTagList() != null) {
            for (int i = 0; i < article.getTagList().size(); i++) {
                ArticleTagRef articleTagRef = new ArticleTagRef(article.getArticleId(), article.getTagList().get(i).getTagId());
                articleTagRefMapper.insert(articleTagRef);
            }
        }
    }

    /**
     * 添加分类与文章关系
     *
     * @param article 文章
     */
    private void addArticleCategory(Article article) {
        if (article.getCategoryList() != null) {
            for (int i = 0; i < article.getCategoryList().size(); i++) {
                ArticleCategoryRef articleCategoryRef = new ArticleCategoryRef(article.getArticleId(), article.getCategoryList().get(i).getCategoryId());
                articleCategoryRefMapper.insert(articleCategoryRef);
            }
       }
    }

    @Override
    public PageInfo<Article> pageArticle(Integer pageIndex, Integer pageSize, Map<String, Object> criteria) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Article> articleList = articleMapper.findAll(criteria);
        for (int i = 0; i < articleList.size(); i++) {
            // 封装 CategoryList
            List<Category> categoryList = articleCategoryRefMapper.listCategoryByArticleId(articleList.get(i).getArticleId());
            if (categoryList == null || categoryList.size() == 0) {
                categoryList = new ArrayList<>();
                categoryList.add(Category.Default());
            }
            articleList.get(i).setCategoryList(categoryList);

            // 封装 TagList
            List<Tag> tagList = articleTagRefMapper.listTagByArticleId(articleList.get(i).getArticleId());
            articleList.get(i).setTagList(tagList);
        }
        PageInfo<Article> pageInfo = new PageInfo<>(articleList);
        return pageInfo;
    }

    @Override
    public void deleteArticle(Integer id) {
        articleMapper.deleteById(id);
        articleCategoryRefMapper.deleteByArticleId(id);
        articleTagRefMapper.deleteByArticleId(id);
    }

    @Override
    public Article getArticleByStatusAndId(Integer status, Integer id) {
        Article article = articleMapper.getArticleByStatusAndId(status, id);
        if (article != null) {
            List<Category> categoryList = articleCategoryRefMapper.listCategoryByArticleId(article.getArticleId());
            List<Tag> tagList = articleTagRefMapper.listTagByArticleId(article.getArticleId());
            article.setCategoryList(categoryList);
            article.setTagList(tagList);
        }
        return article;
    }

    @Override
    public int countArticleByCategoryId(Integer id) {
        return articleCategoryRefMapper.countArticleByCategoryId(id);
    }


    @Override
    public int countArticleView() {
        return articleMapper.countArticleView();
    }

    @Override
    public Article getLastUpdateArticle() {
        return articleMapper.lastUpdateArticle();
    }

    @Override
    public List<Integer> listCategoryIdByArticleId(Integer articleId) {
        return articleCategoryRefMapper.selectCategoryIdByArticleId(articleId);
    }

    @Override
    public List<Article> listArticleByCategoryIds(List<Integer> categoryIds, int limit) {
       if (categoryIds == null || categoryIds.size() == 0) {
           return null;
       }
        return articleMapper.findArticleByCategoryIds(categoryIds, limit);
    }

    @Override
    public List<Article> listArticleByViewCount(int limit) {
        return articleMapper.listArticleByViewCount(limit);
    }

    @Override
    public Article getAfterArticle(Integer articleId) {
        return articleMapper.getAfterArticle(articleId);
    }

    @Override
    public Article getPreArticle(Integer articleId) {
        return articleMapper.getPreArticle(articleId);
    }

    @Override
    public List<Article> listRandomArticle(int limit) {
        return articleMapper.listRandomArticle(limit);
    }

    @Override
    public List<Article> newArticleList(int i) {
        return articleMapper.newArticleList(i);
    }


}
