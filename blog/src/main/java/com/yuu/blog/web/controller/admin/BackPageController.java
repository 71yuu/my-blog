package com.yuu.blog.web.controller.admin;

import com.yuu.blog.pojo.Page;
import com.yuu.blog.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;

/**
 * Page Controller
 *
 * @Classname BackPageController
 * @Date 2019/1/8 20:00
 * @Created by Yuu
 */
@Controller
@RequestMapping("/admin/page")
public class BackPageController {

    @Autowired
    private PageService pageService;

    /**
     * 后台页面列表显示
     *
     * @return
     */
    @RequestMapping("")
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView();

        List<Page> pageList =   pageService.listPage(null);
        modelAndView.addObject("pageList", pageList);

        modelAndView.setViewName("/Admin/Page/index");
        return modelAndView;
    }

    /**
     * 编辑页面显示
     *
     * @param id 页面 ID
     * @return
     */
    @RequestMapping("/edit/{id}")
    public ModelAndView editPageView(@PathVariable("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();

        Page page = pageService.getPageById(id);
        modelAndView.addObject("page", page);

        modelAndView.setViewName("/Admin/Page/edit");
        return modelAndView;
    }

    /**
     * 添加或编辑页面信息
     *
     * @param page 页面
     * @return
     */
    @RequestMapping("/save")
    public String savePage(Page page, HttpServletRequest request) {
        Page checkPage = pageService.getPageByKey(null, page.getPageKey());
        // 新增
        if (page.getPageId() == null) {
            if (checkPage != null) {
                request.setAttribute("errMsg", "别名已存在");
                return "Admin/Page/edit";
            } else {
                pageService.savePage(page);
            }
        }

        // 编辑
        else {
            if (checkPage != null) {
                if (Objects.equals(checkPage.getPageId(), page.getPageId())) {
                    pageService.savePage(page);
                } else {
                    request.setAttribute("errMsg", "别名已存在");
                    return "Admin/Page/edit";
                }
            } else {
                pageService.savePage(page);
            }
        }

        return "redirect:/admin/page";
    }

    /**
     * 删除页面
     *
     * @param id 页面 ID
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void deletePage(@PathVariable("id") Integer id) {
        pageService.deletePage(id);
    }

    /**
     * 后台添加页面显示
     *
     * @return
     */
    @RequestMapping("/insert")
    public ModelAndView insertPageView() {
       ModelAndView modelAndView = new ModelAndView();

       modelAndView.setViewName("Admin/Page/edit");
       return modelAndView;
    }


}
