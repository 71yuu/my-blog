package com.yuu.blog.service.impl;

import com.yuu.blog.dao.UserMapper;
import com.yuu.blog.pojo.User;
import com.yuu.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.List;

/**
 * 用户管理
 *
 * @Classname UserServiceImpl
 * @Date 2019/1/5 20:29
 * @Created by Yuu
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(User user) {
        User currentUser = userMapper.getUserByUsername(user.getUserName());
        if (currentUser != null) {
            // 明文密码加密
            String md5Password = DigestUtils.md5DigestAsHex(user.getUserPass().getBytes());
            if (md5Password.equals(currentUser.getUserPass())) {
                return currentUser;
            }
        }
        return null;
    }

    @Override
    public void updateUser(User user) {
        userMapper.update(user);
    }

    @Override
    public List<User> ListUser() {
        return userMapper.listUser();
    }

    @Override
    public User getUserById(Integer id) {
        return userMapper.getUser(id);
    }

    @Override
    public void saveUser(User user) {

        // 新增用户
        if (user.getUserId() == null) {
            user.setUserPass(DigestUtils.md5DigestAsHex(user.getUserPass().getBytes()));
            userMapper.insertUser(user);
        }

        // 编辑用户
        else {
            user.setUserPass(DigestUtils.md5DigestAsHex(user.getUserPass().getBytes()));
            userMapper.update(user);
        }
    }

    @Override
    public void deleteUser(Integer id) {
        userMapper.deleteById(id);
    }

    @Override
    public User getUserByUserName(String username) {
        return userMapper.getUserByUsername(username);
    }

    @Override
    public User getUserByEmail(String email) {
        return userMapper.getUserByEmail(email);
    }
}
