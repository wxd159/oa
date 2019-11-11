package com.nuc.oa.dao;

import com.nuc.oa.entity.LeaveRecord;

import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/7 17:49
 * @Description:
 */
public interface LeaveRecordDao {
    void insert(LeaveRecord leaveRecord);
    List<LeaveRecord> selectByLeave(int id);
}
