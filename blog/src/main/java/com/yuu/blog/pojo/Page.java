package com.yuu.blog.pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Yuu
 */
@Data
public class Page implements Serializable{

    private static final long serialVersionUID = 3927496662110298634L;
    private Integer pageId;

    private String pageKey;

    private String pageTitle;

    private String pageHtml;

    private String pageContent;

    private Date pageCreateTime;

    private Date pageUpdateTime;

    private Integer pageViewCount;

    private Integer pageCommentCount;

    private Integer pageStatus;

}