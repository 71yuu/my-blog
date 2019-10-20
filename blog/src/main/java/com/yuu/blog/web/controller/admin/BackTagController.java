package com.yuu.blog.web.controller.admin;

import com.yuu.blog.pojo.Tag;
import com.yuu.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Tag Controller
 *
 * @Classname BackTagController
 * @Date 2019/1/8 14:37
 * @Created by Yuu
 */
@Controller
@RequestMapping("/admin/tag")
public class BackTagController {

    @Autowired
    private TagService tagService;

    /**
     * 后台标签列表显示
     *
     * @return
     */
    @RequestMapping(value = "")
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView();
        List<Tag> tagList = tagService.listTagWithCount();
        modelAndView.addObject("tagList", tagList);

        modelAndView.setViewName("Admin/Tag/index");
        return modelAndView;
    }

    /**
     * 后台添加或编辑标签
     *
     * @param tag 标签
     * @return
     */
    @RequestMapping("/save")
    public String insertTagSumit(Tag tag) {
        tagService.insertTag(tag);
        return "redirect:/admin/tag";
    }

    /**
     * 删除标签
     *
     * @param id 标签 ID
     * @return
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void deleteTag(@PathVariable("id") Integer id) {
        Integer count = tagService.countArticleByTagId(id);

        if (count == 0) {
            tagService.deleteTag(id);
        }
    }

    /**
     * 编辑标签页面显示
     *
     * @param id 标签 ID
     * @return
     */
    @RequestMapping("/edit/{id}")
    public ModelAndView editTagView(@PathVariable("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();

        Tag tag = tagService.getTagById(id);
        modelAndView.addObject("tag", tag);

        List<Tag> tagList = tagService.listTagWithCount();
        modelAndView.addObject("tagList", tagList);

        modelAndView.setViewName("/Admin/Tag/index");
        return modelAndView;
    }





}
