package com.yuu.blog.web.controller.admin;

import com.yuu.blog.pojo.Article;
import com.yuu.blog.pojo.User;
import com.yuu.blog.service.ArticleService;
import com.yuu.blog.service.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.yuu.blog.utils.Functions.getIpAddr;

/**
 * @Classname AdminController
 * @Date 2019/1/4 14:22
 * @Created by Yuu
 */
@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;


    /**
     * 跳转到登录页面
     *
     * @return
     */
    @RequestMapping(value = "/admin/login", method = RequestMethod.GET)
    public ModelAndView loginView() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/Admin/login");
        return modelAndView;
    }

    /**
     * 登录验证
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/loginVerify", method = RequestMethod.POST)
    @ResponseBody
    public String loginVerify(User user, HttpServletRequest request){
        Map<String, Object> map = new HashMap<String, Object>();

        User currentUser = userService.login(user);

        // 登录失败
        if (currentUser == null) {
            map.put("code", 0);
            map.put("msg", "用户名或密码错误！");
        }

        // 登录成功
        else {
            map.put("code", 1);
            request.getSession().setAttribute("user", currentUser);
            currentUser.setUserLastLoginTime(new Date());
            currentUser.setUserLastLoginIp(getIpAddr(request));
            userService.updateUser(currentUser);
        }
        String result = new JSONObject(map).toString();
        return result;
    }

    /**
     * 后台首页
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String index(Model model){
        // 文章列表
        List<Article> articleList = articleService.listRecentArticle();
        model.addAttribute("articleList", articleList);
       return "Admin/index";
    }

    /**
     * 退出登录
     *
     * @return
     */
    @RequestMapping(value = "/admin/logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/admin/login";
    }
}
