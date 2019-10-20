package com.yuu.blog.service.impl;

import com.yuu.blog.dao.PageMapper;
import com.yuu.blog.pojo.Page;
import com.yuu.blog.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Page ServiceImpl
 *
 * @Classname PageServiceImpl
 * @Date 2019/1/8 20:10
 * @Created by Yuu
 */
@Service
public class PageServiceImpl implements PageService {

    @Autowired
    private PageMapper pageMapper;

    @Override
    public List<Page> listPage(Integer status) {
        return pageMapper.listPage(status);
    }

    @Override
    public Page getPageById(Integer id) {
        return pageMapper.getPage(id);
    }

    @Override
    public Page getPageByKey(Integer status, String pageKey) {
        return pageMapper.getPageByKey(status, pageKey);
    }

    @Override
    public void savePage(Page page) {

        // 新增页面
        if (page.getPageId() == null) {
            pageMapper.insertPage(page);
        }

        // 编辑页面
        else {
            pageMapper.updatePage(page);
        }
    }

    @Override
    public void deletePage(Integer id) {
        pageMapper.deletePage(id);
    }
}
