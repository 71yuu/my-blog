package com.yuu.blog.dao;

import com.yuu.blog.pojo.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 分类 Mapper
 *
 * @Classname CategoryMapper
 * @Date 2019/1/7 14:57
 * @Created by Yuu
 */
@Repository
public interface CategoryMapper {

    /**
     * 获取分类列表
     *
     * @return 分类列表
     */
    List<Category> listCategory();

    /**
     * 添加分类
     *
     * @param category 分类
     */
    void insert(Category category);

    /**
     * 删除分类
     *
     * @param categoryId 分类 ID
     */
    void deleteCategory(Integer categoryId);

    /**
     * 根据 ID 获取分类
     *
     * @param categoryId 分类 ID
     * @return
     */
    Category getCategoryById(Integer categoryId);

    /**
     * 编辑分类
     *
     * @param category 分类
     */
    void updateCategory(Category category);

    /**
     * 获取总分类数
     *
     * @return
     */
    int countCategory();
}
