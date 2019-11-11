package com.nuc.oa.biz;

import com.nuc.oa.entity.Notice;

import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/8 21:58
 * @Description:
 */
public interface NoticeBiz {
    void add(Notice notice);
    void edit(Notice notice);
    void delete(int id);
    Notice get(int id);
    List<Notice> getAll();
    List<Notice> getByContent(String content);
}
