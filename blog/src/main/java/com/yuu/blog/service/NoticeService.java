package com.yuu.blog.service;

import com.yuu.blog.pojo.Notice;

import java.util.List;

/**
 * Notice Service
 * 
 * @Classname NoticeService
 * @Date 2019/1/8 23:27
 * @Created by Yuu
 */
public interface NoticeService {

    /**
     * 获取公告列表
     *
     * @param status 状态
     * @return
     */
    List<Notice> listNotice(Integer status);

    /**
     * 根据 ID 获取公告信息
     *
     * @param id 公告 ID
     * @return
     */
    Notice getLinkById(Integer id);

    /**
     * 保存公告信息
     *
     * @param notice 公告
     */
    void save(Notice notice);

    /**
     * 删除公告信息
     *
     * @param id 公告 ID
     */
    void deleteNotice(Integer id);

    /**
     * 根据 ID 获取公告
     *
     * @param noticeId 公告 ID
     * @return
     */
    Notice getNoticeById(Integer noticeId);
}
