package com.yuu.blog.web.controller.home;

import com.yuu.blog.common.ArticleStatus;
import com.yuu.blog.pojo.Article;
import com.yuu.blog.pojo.Tag;
import com.yuu.blog.pojo.User;
import com.yuu.blog.service.ArticleService;
import com.yuu.blog.service.TagService;
import com.yuu.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Article Controller
 *
 * @Classname ArticleController
 * @Date 2019/1/10 21:02
 * @Created by Yuu
 */
@Controller
public class ArticleController {


    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;

    @Autowired
    private TagService tagService;

    /**
     * 文章详情页显示
     *
     * @param articleId 文章 Id
     * @param model
     * @return
     */
    @RequestMapping("/article/{articleId}")
    public String getArticleDetailPage(@PathVariable("articleId") Integer articleId, Model model) {

        // 文章信息，分类，标签，作者，评论
        Article article = articleService.getArticleByStatusAndId(ArticleStatus.PUBLISH.getValue(), articleId);
        if (article == null) {
            return "Home/Error/404";
        }

        // 用户信息
        User user = userService.getUserById(article.getArticleUserId());
        article.setUser(user);

        // 文章信息
        model.addAttribute("article", article);

        // 相关文章
        List<Integer> categoryIds = articleService.listCategoryIdByArticleId(articleId);
        List<Article> similarArticleList = articleService.listArticleByCategoryIds(categoryIds, 5);
        model.addAttribute("similarArticleList", similarArticleList);

        // 猜你喜欢
        List<Article> mostViewArticleList = articleService.listArticleByViewCount(5);
        model.addAttribute("mostViewArticleList", mostViewArticleList);

        // 获取下一篇文章
        Article afterArticle = articleService.getAfterArticle(articleId);
        model.addAttribute("afterArticle", afterArticle);

        // 获取上一篇文章
        Article preArticle = articleService.getPreArticle(articleId);
        model.addAttribute("preArticle", preArticle);

        // 标签列表显示
        List<Tag> allTagList = tagService.listTag();
        model.addAttribute("allTagList", allTagList);

        // 获取随机文章
        List<Article> randomArticleList = articleService.listRandomArticle(8);
        model.addAttribute("randomArticleList", randomArticleList);

        return "Home/Page/articleDetail";
    }

    /**
     * 点赞增加
     *
     * @param id 文章 ID
     * @return 点赞总数量
     */
    @RequestMapping(value = "/article/like/{id}", method= RequestMethod.POST)
    @ResponseBody
    public Integer increaseLikeCount(@PathVariable("id")Integer id) {
        Article article = articleService.getArticleByStatusAndId(ArticleStatus.PUBLISH.getValue(), id);
        Integer articleLikeCount = article.getArticleLikeCount() + 1;
        article.setArticleLikeCount(articleLikeCount);
        articleService.insertArticle(article);
        return articleLikeCount;
    }

    /**
     * 浏览增加
     *
     * @param id 文章 ID
     * @return
     */
    @RequestMapping(value = "/article/view/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Integer increaseViewCount(@PathVariable("id") Integer id) {
        Article article = articleService.getArticleByStatusAndId(ArticleStatus.PUBLISH.getValue(), id);
        Integer articleViewCount = article.getArticleViewCount() + 1;
        article.setArticleViewCount(articleViewCount);
        articleService.insertArticle(article);
        return articleViewCount;
    }
}
