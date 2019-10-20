package com.yuu.blog.pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Yuu
 */
@Data
public class Notice implements Serializable{

    private static final long serialVersionUID = -4901560494243593100L;
    private Integer noticeId;

    private String noticeTitle;

    private String noticeHtml;

    private String noticeContent;

    private Date noticeCreateTime;

    private Date noticeUpdateTime;

    private Integer noticeStatus;

    private Integer noticeOrder;
}