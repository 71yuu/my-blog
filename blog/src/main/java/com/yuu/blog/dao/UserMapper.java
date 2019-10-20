package com.yuu.blog.dao;

import com.yuu.blog.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * User Mapper
 *
 * @Classname UserMapper
 * @Date 2019/1/5 20:56
 * @Created by Yuu
 */
@Repository
public interface UserMapper {

    /**
     * 根据用户名获取用户
     *
     * @param username 用户名
     * @return
     */
    User getUserByUsername(String username);

    /**
     * 更新用户
     *
     * @param user
     */
    void update(User user);

    /**
     * 获取用户列表
     *
     * @return
     */
    List<User> listUser();

    /**
     * 根据 ID 获取用户信息
     *
     * @param id
     * @return
     */
    User getUser(Integer id);

    /**
     * 添加用户
     *
     * @param user 用户
     */
    void insertUser(User user);

    /**
     * 删除用户
     *
     * @param id 用户 ID
     */
    void deleteById(Integer userId);

    /**
     * 根据邮箱获取用户
     *
     * @param email 邮箱
     * @return
     */
    User getUserByEmail(String userEmail);
}
