package com.yuu.blog.web.controller.home;

import com.yuu.blog.pojo.Article;
import com.yuu.blog.pojo.Page;
import com.yuu.blog.service.ArticleService;
import com.yuu.blog.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Classname PageController
 * @Date 2019/1/12 16:01
 * @Created by Yuu
 */
@Controller
public class PageController {

    @Autowired
    private PageService pageService;

    @Autowired
    private ArticleService articleService;

    /**
     * 页面详情页面
     *
     * @param key 关键字
     * @param model
     * @return
     */
    @RequestMapping("/{key}")
    public String pageDetail(@PathVariable("key") String key, Model model) {
        Page page = pageService.getPageByKey(1, key);
        if (page == null) {
            return "redirect:/404";
        }
        model.addAttribute("page", page);

        // 侧边栏显示
        // 获取最新文章
        List<Article> newArticleList = articleService.newArticleList(8);
        model.addAttribute("newArticleList", newArticleList);

        return "Home/Page/page";
    }
}
