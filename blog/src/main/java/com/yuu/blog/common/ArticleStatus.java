package com.yuu.blog.common;

/**
 * 文章状态
 * @Classname ArticleStatus
 * @Date 2019/1/6 22:44
 * @Created by Yuu
 */
public enum ArticleStatus {

    DRAFT(0, "草稿"),
    PUBLISH(1, "已发布");

    private Integer value;

    private String message;

    ArticleStatus(Integer value, String message) {
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

    public void setMessage(String message){
        this.message = message;
    }
}
