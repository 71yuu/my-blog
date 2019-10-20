package com.yuu.blog.service;

import com.yuu.blog.pojo.User;

import java.util.List;

/**
 * @Classname UserService
 * @Date 2019/1/5 20:28
 * @Created by Yuu
 */
public interface UserService {

    /**
     * 用户登录验证
     *
     * @param user 用户
     * @return
     */
    User login(User user);

    /**
     * 修改用户信息
     *
     * @param user 用户
     */
    void updateUser(User user);

    /**
     * 获取用户列表
     *
     * @return
     */
    List<User> ListUser();

    /**
     * 根据 ID 获取用户信息
     *
     * @param id 用户 ID
     * @return
     */
    User getUserById(Integer id);

    /**
     * 新增或编辑用户
     *
     * @param user 用户
     */
    void saveUser(User user);

    /**
     * 删除用户
     *
     * @param id 用户 ID
     */
    void deleteUser(Integer id);

    /**
     * 根据用户名获取用户
     *
     * @param username 用户名
     * @return
     */
    User getUserByUserName(String username);

    /**
     * 根据邮箱获取用户名
     *
     * @param email 邮箱
     * @return
     */
    User getUserByEmail(String email);
}
