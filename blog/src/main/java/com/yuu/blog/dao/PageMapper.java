package com.yuu.blog.dao;

import com.yuu.blog.pojo.Page;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Page Mapper
 *
 * @Classname PageMapper
 * @Date 2019/1/8 20:12
 * @Created by Yuu
 */
@Repository
public interface PageMapper {

    /**
     * 获取页面列表
     *
     * @param status 状态
     * @return
     */
    List<Page> listPage(@Param("status") Integer status);

    /**
     * 根据页面 ID 获取页面信息
     *
     * @param pageId 页面 ID
     * @return
     */
    Page getPage(Integer pageId);

    /**
     * 根据别名和状态获取页面信息
     *
     * @param status 状态
     * @param pageKey 别名
     * @return
     */
    Page getPageByKey(@Param("status") Integer status, @Param("pageKey") String pageKey);

    /**
     * 新增页面
     *
     * @param page 页面
     */
    void insertPage(Page page);

    /**
     * 编辑页面
     *
     * @param page 页面
     */
    void updatePage(Page page);

    /**
     * 删除页面
     * @param id 页面 ID
     */
    void deletePage(Integer pageId);
}
