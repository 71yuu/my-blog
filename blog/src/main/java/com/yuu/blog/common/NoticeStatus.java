package com.yuu.blog.common;

/**
 * Notice Status
 *
 * @Classname NoticeStatus
 * @Date 2019/1/10 12:32
 * @Created by Yuu
 */
public enum NoticeStatus {

    NORMAL(1, "显示"),
    HIDDEN(0, "隐藏");

    private Integer value;

    private String mssage;

    NoticeStatus(Integer value, String mssage) {
        this.value = value;
        this.mssage = mssage;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public String getMssage() {
        return mssage;
    }

    public void setMssage(String mssage) {
        this.mssage = mssage;
    }}
