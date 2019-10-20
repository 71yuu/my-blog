package com.yuu.blog.web.interceptor;

import com.yuu.blog.common.ArticleStatus;
import com.yuu.blog.pojo.Article;
import com.yuu.blog.pojo.Category;
import com.yuu.blog.pojo.Options;
import com.yuu.blog.pojo.Page;
import com.yuu.blog.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.context.request.WebRequestInterceptor;

import java.util.ArrayList;
import java.util.List;


/**
 * @Classname HomeResourceInterceptor
 * @Date 2019/1/6 21:14
 * @Created by Yuu
 */
public class HomeResourceInterceptor implements WebRequestInterceptor {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private TagService tagService;

    @Autowired
    private OptionsService optionsService;

    @Autowired
    private PageService pageService;

    /**
     * 在请求处理之前执行，该方法主要是用于准备资源数据的，然后可以把它们当请求属性放到 WebRequest 中
     * @param request
     * @throws Exception
     */
    @Override
    public void preHandle(WebRequest request) throws Exception {

        // 分类显示
        List<Category> categoryList = categoryService.listCategory();
        request.setAttribute("allCategoryList", categoryList, WebRequest.SCOPE_REQUEST);

        // 所有页面
        List<Page> pageList = pageService.listPage(1);
        request.setAttribute("pageList", pageList, WebRequest.SCOPE_REQUEST);

        // 获得网站概况
        List<String> siteBasicStatistics = new ArrayList<String>();
        siteBasicStatistics.add(articleService.countArticle(ArticleStatus.PUBLISH.getValue()) + "");
        siteBasicStatistics.add(categoryService.countCategory() + "");
        siteBasicStatistics.add(tagService.countTag() + "");
        siteBasicStatistics.add(articleService.countArticleView() + "");
        request.setAttribute("siteBasicStatistics", siteBasicStatistics, WebRequest.SCOPE_REQUEST);

        // 最后更新的文章
        Article lastUpdateArticle = articleService.getLastUpdateArticle();
        request.setAttribute("lastUpdateArticle", lastUpdateArticle, WebRequest.SCOPE_REQUEST);

        // 博客基本信息显示（Options)
        Options options = optionsService.getOptions();
        request.setAttribute("options", options, WebRequest.SCOPE_REQUEST);

    }

    /**
     * 这个方法将在 Controller 执行之后执行，返回视图之前执行， ModelMap 表示请求 Controller 处理之后返回的 Model 对象，所以可以在
     * 这个方法中修改 ModelMap 的属性，从而达到改变返回的模型的结果
     */
    @Override
    public void postHandle(WebRequest webRequest, ModelMap modelMap) throws Exception {

    }

    /**
     * 这个方法将在整个请求完成之后，也就是说在视图渲染之后进行调用，主要用于进行一些资源的释放
     */
    @Override
    public void afterCompletion(WebRequest webRequest, Exception e) throws Exception {

    }
}
