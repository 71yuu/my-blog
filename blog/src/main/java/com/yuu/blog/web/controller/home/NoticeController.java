package com.yuu.blog.web.controller.home;

import com.yuu.blog.pojo.Article;
import com.yuu.blog.pojo.Notice;
import com.yuu.blog.service.ArticleService;
import com.yuu.blog.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Classname NoticeController
 * @Date 2019/1/13 13:52
 * @Created by Yuu
 */
@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private ArticleService articleService;

    /**
     * 公告详情页显示
     *
     * @param noticeId 公告 ID
     * @param model
     * @return
     */
    @RequestMapping("/notice/{noticeId}")
    public String noticeDetailView(@PathVariable("noticeId") Integer noticeId, Model model){

        // 公告内容和信息显示
        Notice notice = noticeService.getNoticeById(noticeId);
        model.addAttribute("notice", notice);

        // 侧边栏显示
        // 获得最新文章
        List<Article> newArticleList = articleService.newArticleList(8);
        model.addAttribute("newArticleList", newArticleList);

        return "Home/Page/noticeDetail";
    }
}
