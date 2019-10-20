package com.yuu.blog.service;

import com.yuu.blog.pojo.Page;

import java.util.List;

/**
 * Page Service
 * 
 * @Classname PageService
 * @Date 2019/1/8 20:08
 * @Created by Yuu
 */
public interface PageService {

    /**
     * 获得页面列表
     *
     * @param status 状态
     * @return
     */
    List<Page> listPage(Integer status);

    /**
     * 根据页面 ID 获取页面信息
     *
     * @param id 页面 ID
     * @return
     */
    Page getPageById(Integer id);

    /**
     * 根据页面别名获取页面信息
     *
     * @param status
     * @param pageKey
     * @return
     */
    Page getPageByKey(Integer status, String pageKey);

    /**
     * 保存页面信息
     *
     * @param page 页面
     */
    void savePage(Page page);

    /**
     * 删除页面
     *
     * @param id 页面 ID
     */
    void deletePage(Integer id);
}
