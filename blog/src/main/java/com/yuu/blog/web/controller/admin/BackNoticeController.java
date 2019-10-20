package com.yuu.blog.web.controller.admin;

import com.yuu.blog.pojo.Notice;
import com.yuu.blog.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Notice Controller
 *
 * @Classname BackNoticeController
 * @Date 2019/1/8 23:20
 * @Created by Yuu
 */
@Controller
@RequestMapping("/admin/notice")
public class BackNoticeController {

    @Autowired
    private NoticeService noticeService;

    /**
     * 公告列表页面显示
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "")
    public String index(Model model) {
        List<Notice> noticeList = noticeService.listNotice(null);
        model.addAttribute("noticeList", noticeList);
        return "Admin/Notice/index";
    }

    /**
     * 公告编辑页面显示
     *
     * @param id 公告 ID
     * @return
     */
    @RequestMapping("/edit/{id}")
    public ModelAndView editNotice(@PathVariable("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();

        Notice notice = noticeService.getLinkById(id);
        modelAndView.addObject("notice", notice);

        modelAndView.setViewName("/Admin/Notice/edit");
        return modelAndView;
    }

    /**
     * 新增或编辑公告
     *
     * @param notice 公告
     * @return
     */
    @RequestMapping("/save")
    public String saveNotice(Notice notice) {
        noticeService.save(notice);
        return "redirect:/admin/notice";
    }

    /**
     * 删除公告
     *
     * @param id 公告 ID
     */
    @RequestMapping("/delete/{id}")
    @ResponseBody
    public void deleteNotice(@PathVariable("id") Integer id) {
        noticeService.deleteNotice(id);
    }

    /**
     * 新增公告显示
     *
     * @return
     */
    @RequestMapping("/insert")
    public String insertNoticeView() {
        return "/Admin/Notice/edit";
    }
}
