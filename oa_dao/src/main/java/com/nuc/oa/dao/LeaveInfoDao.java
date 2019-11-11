package com.nuc.oa.dao;

import com.nuc.oa.entity.LeaveInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/7 17:35
 * @Description:
 */
@Repository("leaveInfoDao")
public interface LeaveInfoDao {
    void insert(LeaveInfo leaveInfo);
    void update(LeaveInfo leaveInfo);
    void delete(int id);
    LeaveInfo select(int id);
    List<LeaveInfo> selectByCreateSn(String csn);
    List<LeaveInfo> selectByNextDealSn(String ndsn);
}
