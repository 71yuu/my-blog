package com.yuu.blog.service.impl;

import com.yuu.blog.dao.ArticleCategoryRefMapper;
import com.yuu.blog.dao.ArticleTagRefMapper;
import com.yuu.blog.dao.TagMapper;
import com.yuu.blog.pojo.Tag;
import com.yuu.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname TagServiceImpl
 * @Date 2019/1/7 15:03
 * @Created by Yuu
 */
@Service
public class TagServiceImpl implements TagService {

    @Autowired
    private TagMapper tagMapper;

    @Autowired
    private ArticleTagRefMapper articleTagRefMapper;

    @Override
    public List<Tag> listTag() {
        return tagMapper.listTag();
    }

    @Override
    public List<Tag> listTagWithCount() {
        List<Tag> tagList = null;
        tagList = tagMapper.listTag();
        for (int i = 0; i < tagList.size(); i++) {
            Integer count = articleTagRefMapper.countArticleByTagId(tagList.get(i).getTagId());
            tagList.get(i).setArticleCount(count);
        }
        return tagList;
    }

    @Override
    public void insertTag(Tag tag) {

        // 添加标签
        if (tag.getTagId() == null) {
            tagMapper.insertTag(tag);
        }

        // 编辑标签
        else {
            tagMapper.updateTag(tag);
        }
    }

    @Override
    public Integer countArticleByTagId(Integer id) {
        return articleTagRefMapper.countArticleByTagId(id);
    }

    @Override
    public void deleteTag(Integer id) {
        tagMapper.deleteTag(id);
    }

    @Override
    public Tag getTagById(Integer id) {
        return tagMapper.getTag(id);
    }

    @Override
    public int countTag() {
        return tagMapper.countTag();
    }
}
