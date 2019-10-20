package com.yuu.blog.web.controller.admin;

import com.yuu.blog.pojo.User;
import com.yuu.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User Controller
 *
 * @Classname BackUserController
 * @Date 2019/1/9 20:07
 * @Created by Yuu
 */

@Controller
@RequestMapping("/admin/user")
public class BackUserController {

    @Autowired
    private UserService userService;

    /**
     * 后台用户列表显示
     *
     * @return
     */
    @RequestMapping("")
    public ModelAndView userListView() {
        ModelAndView modelAndView = new ModelAndView();

        List<User> userList = userService.ListUser();
        modelAndView.addObject("userList", userList);

        modelAndView.setViewName("Admin/User/index");
        return modelAndView;
    }

    /**
     * 编辑用户页面显示
     *
     * @param id 用户 ID
     * @return
     */
    @RequestMapping("/edit/{id}")
    public ModelAndView editUserView(@PathVariable("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();

        User user = userService.getUserById(id);
        modelAndView.addObject(user);

        modelAndView.setViewName("Admin/User/edit");
        return modelAndView;
    }

    /**
     * 后台添加用户页面
     *
     * @return
     */
    @RequestMapping("/insert")
    public String insertUserView() {
        return "Admin/User/insert";
    }

    /**
     * 新增或编辑用户
     *
     * @param user 用户
     * @return
     */
    @RequestMapping("/save")
    public String saveUser(User user) {
        userService.saveUser(user);
        return "redirect:/admin/user";
    }

    /**
     * 删除用户
     *
     * @param id 用户 ID
     */
    @RequestMapping("/delete/{id}")
    @ResponseBody
    public void deleteUser(@PathVariable("id") Integer id) {
        userService.deleteUser(id);
    }

    /**
     * 检查用户名是否存在
     *
     * @param username 用户名
     * @param id 用户 ID
     * @param model
     * @return
     */
    @RequestMapping(value = "/checkUserName", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> checkUserName(String username, @RequestParam(required = false) Integer id, Model model) {
        Map<String, Object> map = new HashMap<String, Object>();

        User user = userService.getUserByUserName(username);

        return checkExist(user, map, id , "用户名已存在!");
    }

    /**
     * 检查 Email 是否存在
     *
     * @param email 邮箱
     * @param id 用户 ID
     * @return
     */
    @RequestMapping(value = "/checkUserEmail", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> checkUserEmail(String email, @RequestParam(required = false) Integer id) {
        Map<String, Object> map = new HashMap<String, Object>();

        User user = userService.getUserByEmail(email);

        return checkExist(user, map, id , "邮箱已存在!");
    }

    /**
     * 验证方法
     *
     * @param user
     * @param map
     * @param id
     * @param msg
     * @return
     */
    private Map<String, Object> checkExist(User user, Map<String, Object> map, Integer id, String msg){
        if (user != null) {
            if (id != null) {
                if (user.getUserId() != id) {
                    map.put("code", 1);
                    map.put("msg", msg);
                }  else {
                    map.put("code", 0);
                    map.put("msg", "");
                }
            } else {
                map.put("code", 1);
                map.put("msg", msg);
            }
        } else {
            map.put("code", 0);
        }
        return map;
    }

    /**
     * 基本信息页面显示
     *
     * @param id 用户 ID
     * @return
     */
    @RequestMapping(value = "/profile/{id}")
    public ModelAndView userProfileView(@PathVariable("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();

        User user = userService.getUserById(id);
        modelAndView.addObject("user", user);

        modelAndView.setViewName("Admin/User/profile");
        return modelAndView;
    }


}
