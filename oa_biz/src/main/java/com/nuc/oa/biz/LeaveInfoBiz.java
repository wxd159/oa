package com.nuc.oa.biz;

import com.nuc.oa.entity.LeaveInfo;
import com.nuc.oa.entity.LeaveRecord;

import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/7 19:28
 * @Description:
 */
public interface LeaveInfoBiz {
    void save(LeaveInfo leaveInfo);

    LeaveInfo get(int id);
    List<LeaveRecord> getRecords(int cvid);

    List<LeaveInfo> getForSelf(String id);
    List<LeaveInfo> getForDeal(String id);

    void update(LeaveInfo claimVoucher);
    void submit(int id);
    void deal(LeaveRecord dealRecord);
}
