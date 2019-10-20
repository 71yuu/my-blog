package com.yuu.blog.common;

/**
 * Link Status
 *
 * @Classname LinkStatus
 * @Date 2019/1/10 12:35
 * @Created by Yuu
 */
public enum LinkStatus {

    NORMAL(1, "正常"),
    HIDDEN(0, "隐藏");

    private Integer value;

    private String message;

    LinkStatus(Integer value, String message) {
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
