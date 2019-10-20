package com.yuu.blog.common;

/**
 * 文章是否开启评论
 *
 * @Classname ArticleCommentStatus
 * @Date 2019/1/7 19:11
 * @Created by Yuu
 */
public enum ArticleCommentStatus {

    ALLOW(1, "允许"),
    NOT_ALLOW(0, "不允许");

    private Integer value;

    private String message;

    ArticleCommentStatus(Integer value, String message) {
        this.value = value;
        this.message = message;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
