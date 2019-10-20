package com.yuu.blog.web.controller.admin;

import com.yuu.blog.pojo.Options;
import com.yuu.blog.service.OptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Options Controller
 *
 * @Classname BackOptionsControler
 * @Date 2019/1/9 23:45
 * @Created by Yuu
 */
@Controller
@RequestMapping("/admin/options")
public class BackOptionsControler {

    @Autowired
    private OptionsService optionsService;

    /**
     * 基本信息显示
     *
     * @return
     */
    @RequestMapping("")
    public ModelAndView index() {
       ModelAndView modelAndView = new ModelAndView();

        Options option = optionsService.getOptions();
        modelAndView.addObject("option", option);

        modelAndView.setViewName("Admin/Options/index");
        return modelAndView;
    }

    /**
     * 编辑基本信息提交
     *
     * @param options 基本信息
     * @return
     */
    @RequestMapping(value = "/editSubmit", method = RequestMethod.POST)
    public String editOptionSubmit(Options options) {
        Options optionsCustom = optionsService.getOptions();
        optionsService.save(options);
        return "redirect:/admin/options";
    }


}
