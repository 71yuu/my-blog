package com.yuu.blog.service.impl;

import com.yuu.blog.dao.ArticleCategoryRefMapper;
import com.yuu.blog.dao.CategoryMapper;
import com.yuu.blog.pojo.Category;
import com.yuu.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname CategoryServiceImpl
 * @Date 2019/1/7 14:56
 * @Created by Yuu
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private ArticleCategoryRefMapper articleCategoryRefMapper;

    @Override
    public List<Category> listCategory() {
        return categoryMapper.listCategory();
    }

    @Override
    public List<Category> listCategoryWithCount() {
        List<Category> categoryList = null;
        categoryList = categoryMapper.listCategory();
        for (int i = 0; i < categoryList.size(); i++) {
            Integer count = articleCategoryRefMapper.countArticleByCategoryId(categoryList.get(i).getCategoryId());
            categoryList.get(i).setArticleCount(count);
        }
        return categoryList;
    }

    @Override
    public void insertCategory(Category category) {
        // 新增分类
        if (category.getCategoryId() == null) {
            categoryMapper.insert(category);
        }

        // 编辑分类
        else {
            categoryMapper.updateCategory(category);
        }
    }

    @Override
    public void deleteCategory(Integer id) {
        categoryMapper.deleteCategory(id);
        articleCategoryRefMapper.deleteByCategoryId(id);
    }

    @Override
    public Category getCategoryById(Integer categoryId) {
        return categoryMapper.getCategoryById(categoryId);
    }

    @Override
    public int countCategory() {
        return categoryMapper.countCategory();
    }
}
