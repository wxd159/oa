package com.nuc.oa.biz.impl;

import com.nuc.oa.biz.NoticeBiz;
import com.nuc.oa.dao.NoticeDao;
import com.nuc.oa.entity.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/8 21:58
 * @Description:
 */
@Service("noticeBiz")
public class NoticeBizImpl implements NoticeBiz {

    @Autowired
    private NoticeDao noticeDao;

    public void add(Notice notice) {
        noticeDao.insert(notice);
    }

    public void edit(Notice notice) {
        System.out.println(notice.toString());
        noticeDao.update(notice);
    }

    public void delete(int id) {
        noticeDao.delete(id);
    }

    public Notice get(int id) {
        return noticeDao.select(id);
    }

    public List<Notice> getAll() {
        return noticeDao.selectAll();
    }

    public List<Notice> getByContent(String content) {
        return null;
    }
}
