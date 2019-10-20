package com.yuu.blog.service;

import com.yuu.blog.pojo.Options;

/**
 * Options Service
 *
 * @Classname OptionsService
 * @Date 2019/1/9 23:49
 * @Created by Yuu
 */
public interface OptionsService {

    /**
     * 获取基本信息
     *
     * @return
     */
    Options getOptions();

    /**
     * 编辑基本信息
     *
     * @param options 基本信息
     */
    void save(Options options);
}
