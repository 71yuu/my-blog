package com.yuu.blog.web.controller.home;

import com.github.pagehelper.PageInfo;
import com.yuu.blog.common.ArticleStatus;
import com.yuu.blog.pojo.Article;
import com.yuu.blog.pojo.Category;
import com.yuu.blog.pojo.Tag;
import com.yuu.blog.service.ArticleService;
import com.yuu.blog.service.CategoryService;
import com.yuu.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文章分类目录的 Controller
 *
 * @Classname CategoryController
 * @Date 2019/1/11 15:28
 * @Created by Yuu
 */
@Controller
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private TagService tagService;


    /**
     * 根据分类查询文章
     *
     * @param categoryId 分类 ID
     * @param pageIndex 第几页
     * @param pageSize 每页的大小
     * @param model
     * @return
     */
    @RequestMapping("/category/{categoryId}")
    public String getArticleListByCategory(@PathVariable("categoryId") Integer categoryId, @RequestParam(required = false, defaultValue = "1") Integer pageIndex, @RequestParam(required = true, defaultValue = "10") Integer pageSize, Model model) {

        // 该分类信息
        Category category = categoryService.getCategoryById(categoryId);
        if (category == null) {
            return "redirect:/404";
        }
        model.addAttribute("category", category);

        // 文章列表
        Map<String, Object> criteria = new HashMap<>();
        criteria.put("categoryId", categoryId);
        criteria.put("status", ArticleStatus.PUBLISH.getValue());
        PageInfo<Article> articlePageInfo = articleService.pageArticle(pageIndex, pageSize, criteria);
        model.addAttribute("pageInfo", articlePageInfo);

        // 标签
        List<Tag> allTagList = tagService.listTag();
        model.addAttribute("allTagList", allTagList);

        // 获取随机文章
        List<Article> randomArticleList = articleService.listRandomArticle(8);
        model.addAttribute("randomArticleList", randomArticleList);
        model.addAttribute("pageUrlPrefix", "/category/"+ categoryId +"?pageIndex");
        return "Home/Page/articleListByCategory";

    }
}
