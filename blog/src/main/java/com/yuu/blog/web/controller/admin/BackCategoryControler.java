package com.yuu.blog.web.controller.admin;

import com.yuu.blog.pojo.Category;
import com.yuu.blog.service.ArticleService;
import com.yuu.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Classname BackCategoryControler
 * @Date 2019/1/8 0:18
 * @Created by Yuu
 */
@Controller
@RequestMapping("/admin/category")
public class BackCategoryControler {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ArticleService articleService;

    /**
     * 后台分类列表显示
     *
     * @return
     */
    @RequestMapping(value = "")
    public ModelAndView categoryList() {
       ModelAndView modelAndView = new ModelAndView();
       List<Category> categoryList = categoryService.listCategoryWithCount();
       modelAndView.addObject("categoryList", categoryList);
       modelAndView.setViewName("Admin/Category/index");
       return modelAndView;
    }

    /**
     * 后台添加分类提交
     *
     * @param category
     * @return
     */
    @RequestMapping(value = "/insertSubmit", method = RequestMethod.POST)
    public String insertCategorySubmit(Category category) {
       categoryService.insertCategory(category);
        return "redirect:/admin/category";
    }

    /**
     * 删除分类
     *
     * @param id 分类 ID
     * @return
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void deleteCategory(@PathVariable("id") Integer id) {
        // 禁止删除有文章得分类
        Integer count = articleService.countArticleByCategoryId(id);

        if (count == 0) {
            categoryService.deleteCategory(id);
        }
    }

    /**
     * 编辑分类页面显示
     *
     * @param id 分类 ID
     * @return
     */
    @RequestMapping(value = "/edit/{id}")
    public ModelAndView editCategoryView(@PathVariable("id") Integer categoryId) {
        ModelAndView modelAndView = new ModelAndView();

        Category category = categoryService.getCategoryById(categoryId);
        category.setCategoryOrder(category.getCategoryOrder() - 1);
        modelAndView.addObject("category", category);

        List<Category> categoryList = categoryService.listCategoryWithCount();
        modelAndView.addObject("categoryList", categoryList);

        modelAndView.setViewName("Admin/Category/index");
        return modelAndView;
    }




}
