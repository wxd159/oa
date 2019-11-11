package com.nuc.oa.dao;

import com.nuc.oa.entity.Notice;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/8 21:26
 * @Description:
 */
@Repository("noticeDao")
public interface NoticeDao {
    void insert(Notice notice);
    void update(Notice notice);
    void delete(int id);
    Notice select(int id);
    List<Notice> selectAll();
    List<Notice> selectByContent(String content);
}
