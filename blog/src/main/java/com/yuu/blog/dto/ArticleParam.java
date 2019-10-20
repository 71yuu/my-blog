package com.yuu.blog.dto;

import lombok.Data;

import java.util.List;

/**
 * 文章参数对象
 * @Classname ArticleParam
 * @Date 2019/1/7 17:14
 * @Created by Yuu
 */
@Data
public class ArticleParam {

    private Integer articleId;

    private String articleTitle;

    private String articleHtml;

    private String articleContent;

    private Integer articleParentCategoryId;

    private Integer articleChildCategoryId;

    private Integer articleStatus;

    private List<Integer> articleTagIds;
}
