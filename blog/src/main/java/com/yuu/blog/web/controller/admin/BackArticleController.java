package com.yuu.blog.web.controller.admin;

import com.github.pagehelper.PageInfo;
import com.yuu.blog.common.ConstantUtils;
import com.yuu.blog.dto.ArticleParam;
import com.yuu.blog.pojo.*;
import com.yuu.blog.service.ArticleService;
import com.yuu.blog.service.CategoryService;
import com.yuu.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @Classname BackArticleController
 * @Date 2019/1/5 1:04
 * @Created by Yuu
 */
@Controller
@RequestMapping("/admin/article")
public class BackArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private TagService tagService;

    /**
     * 保存草稿
     *
     * @param article
     * @param session
     * @return
     */
    @RequestMapping(value = "/insertDraftSubmit", method = RequestMethod.POST)
    public String insertArticleDraftSubmit(Article article, HttpSession session){

        User user = (User) session.getAttribute(ConstantUtils.SESSION_USER);

        article.setArticleCreateTime(new Date());
        article.setArticleUpdateTime(new Date());
        article.setArticleUserId(user.getUserId());
        article.setArticleIsComment(1);
        article.setArticleStatus(0);

        articleService.insertArticle(article);

        return "redirect:/admin";
    }

    /**
     * 后台文章列表显示
     *
     * @param pageIndex 第几页
     * @param pageSize 每页的大小
     * @param status 文章状态
     * @param model
     * @return
     */
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(@RequestParam(required = false, defaultValue = "1") Integer pageIndex, @RequestParam(required = false, defaultValue = "10") Integer pageSize, Integer status, Model model) {
            Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", status);

        model.addAttribute("pageUrlPrefix", "/admin/article/?pageIndex");
        PageInfo<Article> articlePageInfo = articleService.pageArticle(pageIndex, pageSize, map);
        model.addAttribute("pageInfo", articlePageInfo);
        return "Admin/Article/index";
    }

    /**
     * 删除文章
     *
     * @param id 文章 ID
     */
    @RequestMapping(value = "/delete/{id}")
    public void deleteArticle(@PathVariable("id") Integer id){
        articleService.deleteArticle(id);
    }

    /**
     * 后台添加文章显示页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/insert")
    public String insertArticleView(Model model) {
        List<Category> categoryList = categoryService.listCategory();
        List<Tag> tagList = tagService.listTag();
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("tagList", tagList);
        return "Admin/Article/insert";
    }

    /**
     * 后台添加或者修改文章提交操作
     *
     * @param session
     * @param articleParam
     * @return
     */
    @RequestMapping(value = "/insertSubmit", method = RequestMethod.POST)
    public String insertArticleSubmit(HttpSession session, ArticleParam articleParam){
        Article article = new Article();

        // 用户 ID
        User user = (User)session.getAttribute(ConstantUtils.SESSION_USER);
        if (user != null) {
            article.setArticleUserId(user.getUserId());
        }
        article.setArticleId(articleParam.getArticleId());
        article.setArticleTitle(articleParam.getArticleTitle());
        article.setArticleHtml(articleParam.getArticleHtml());
        article.setArticleContent(articleParam.getArticleContent());
        article.setArticleStatus(articleParam.getArticleStatus());

        // 填充分类
        List<Category> categoryList = new ArrayList<>();
        if (articleParam.getArticleChildCategoryId() != null) {
            categoryList.add(new Category(articleParam.getArticleChildCategoryId()));
        }
        if (articleParam.getArticleParentCategoryId() != null) {
            categoryList.add(new Category(articleParam.getArticleParentCategoryId()));
        }
        article.setCategoryList(categoryList);

        // 填充标签
        List<Tag> tagList = new ArrayList<>();
        if (articleParam.getArticleTagIds() != null) {
            for (int i = 0; i < articleParam.getArticleTagIds().size(); i++) {
                Tag tag = new Tag(articleParam.getArticleTagIds().get(i));
                tagList.add(tag);
            }
        }
        article.setTagList(tagList);

        articleService.insertArticle(article);
        return "redirect:/admin/article";
    }

    /**
     * 编辑文章页面显示
     *
     * @param id 文章 ID
     * @return
     */
    @RequestMapping(value = "/edit/{id}")
    public ModelAndView editArticleView(@PathVariable("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();

        Article article = articleService.getArticleByStatusAndId(null, id);
        modelAndView.addObject("article", article);

        List<Category> categoryList = categoryService.listCategory();
        modelAndView.addObject("categoryList", categoryList);

        List<Tag> tagList = tagService.listTag();
        modelAndView.addObject("tagList", tagList);

        modelAndView.setViewName("Admin/Article/insert");
        return modelAndView;
    }

}
