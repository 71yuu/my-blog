package com.yuu.blog.web.controller.home;

import com.github.pagehelper.PageInfo;
import com.yuu.blog.common.ArticleStatus;
import com.yuu.blog.common.LinkStatus;
import com.yuu.blog.common.NoticeStatus;
import com.yuu.blog.pojo.*;
import com.yuu.blog.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Index Controller
 *
 * @Classname IndexController
 * @Date 2019/1/10 9:06
 * @Created by Yuu
 */
@Controller
public class IndexController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private NoticeService noticeService;


    @Autowired
    private TagService tagService;

    /**
     * 首页分页显示
     *
     * @param pageIndex 当前页数
     * @param pageSize 每页的大小
     * @return
     */
    @RequestMapping(value = {"/", "/article"})
    public ModelAndView index(@RequestParam(required = false, defaultValue = "1") Integer pageIndex, @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        ModelAndView modelAndView = new ModelAndView();

        // 查询条件
       Map<String, Object> criteria = new HashMap<String, Object>();
       criteria.put("status", ArticleStatus.PUBLISH.getValue());

       // 文章列表
       PageInfo<Article> articleList = articleService.pageArticle(pageIndex, pageSize, criteria);
       modelAndView.addObject("pageInfo", articleList);

       // 公告
        List<Notice> noticeList = noticeService.listNotice(NoticeStatus.NORMAL.getValue());
        modelAndView.addObject("noticeList", noticeList);

        // 侧边栏显示
        // 标签列表显示
        List<Tag> allTagList = tagService.listTag();
        modelAndView.addObject("allTagList", allTagList);

        modelAndView.addObject("pageUrlPrefix", "/article?pageIndex");
        modelAndView.setViewName("Home/index");
        return modelAndView;
    }

    /**
     * 搜索
     *
     * @param keywords 关键字
     * @param pageIndex 第几页
     * @param pageSize 每页大小
     * @param model
     * @return
     */
    @RequestMapping(value = "/search")
    public String search(
            @RequestParam("keywords") String keywords,
            @RequestParam(required = false, defaultValue = "1") Integer pageIndex,
            @RequestParam(required = false, defaultValue = "10") Integer pageSize, Model model) {
        //文章列表
        HashMap<String, Object> criteria = new HashMap<>(2);
        criteria.put("status", ArticleStatus.PUBLISH.getValue());
        criteria.put("keywords", keywords);
        PageInfo<Article> articlePageInfo = articleService.pageArticle(pageIndex, pageSize, criteria);
        model.addAttribute("pageInfo", articlePageInfo);

        //标签列表显示
        List<Tag> allTagList = tagService.listTag();
        model.addAttribute("allTagList", allTagList);

        //获得随机文章
        List<Article> randomArticleList = articleService.listRandomArticle(8);
        model.addAttribute("randomArticleList", randomArticleList);

        return "Home/Page/search";
    }
}
