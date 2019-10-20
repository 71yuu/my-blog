package com.yuu.blog.dao;

import com.yuu.blog.pojo.Notice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Notice Mapper
 *
 * @Classname NoticeMapper
 * @Date 2019/1/8 23:30
 * @Created by Yuu
 */
public interface NoticeMapper {

    /**
     * 获取公告列表
     *
     * @param status 状态
     * @return
     */
    List<Notice> listNotice(@Param("status") Integer status);

    /**
     * 根据 ID 获取公告信息
     *
     * @param id 公告 ID
     * @return
     */
    Notice getNotce(Integer id);

    /**
     * 新增公告
     *
     * @param notice 公告
     */
    void insertNotice(Notice notice);

    /**
     * 更新公告
     *
     * @param notice 公告
     */
    void updateNotice(Notice notice);

    /**
     * 删除公告
     *
     * @param id 公告 ID
     */
    void deleteNotice(Integer id);

    /**
     * 获取公告 ID
     *
     * @param noticeId 公告 ID
     * @return
     */
    Notice getNoticeById(Integer noticeId);
}
