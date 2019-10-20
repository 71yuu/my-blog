package com.yuu.blog.service;

import com.yuu.blog.pojo.Category;

import java.util.List;

/**
 * 分类 Service
 *
 * @Classname CategoryService
 * @Date 2019/1/7 14:51
 * @Created by Yuu
 */
public interface CategoryService {

    /**
     * 获取分类列表
     *
     * @return
     */
    List<Category> listCategory();

    /**
     * 获得分类列表
     *
     * @return
     */
    List<Category> listCategoryWithCount();

    /**
     * 添加分类
     *
     * @param category 分类
     */
    void insertCategory(Category category);

    /**
     * 删除分类
     *
     * @param id 分类 ID
     */
    void deleteCategory(Integer id);

    /**
     * 根据 ID 获取分类
     *
     * @return 分类
     */
    Category getCategoryById(Integer categoryId);

    /**
     * 获取总分类数
     *
     * @return
     */
    int countCategory();
}
