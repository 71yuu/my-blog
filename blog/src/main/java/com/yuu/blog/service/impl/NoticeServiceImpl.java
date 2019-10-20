package com.yuu.blog.service.impl;

import com.yuu.blog.dao.NoticeMapper;
import com.yuu.blog.pojo.Notice;
import com.yuu.blog.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname NoticeServiceImpl
 * @Date 2019/1/8 23:28
 * @Created by Yuu
 */
@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> listNotice(Integer status) {
        return noticeMapper.listNotice(status);
    }

    @Override
    public Notice getLinkById(Integer id) {
        return noticeMapper.getNotce(id);
    }

    @Override
    public void save(Notice notice) {

        // 新增公告
        if (notice.getNoticeId() == null) {
            noticeMapper.insertNotice(notice);
        }

        // 编辑公告
        else {
            noticeMapper.updateNotice(notice);
        }
    }

    @Override
    public void deleteNotice(Integer id) {
        noticeMapper.deleteNotice(id);
    }

    @Override
    public Notice getNoticeById(Integer noticeId) {
        return noticeMapper.getNoticeById(noticeId);
    }
}
