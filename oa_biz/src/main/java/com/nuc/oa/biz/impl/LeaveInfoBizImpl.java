package com.nuc.oa.biz.impl;

import com.nuc.oa.biz.LeaveInfoBiz;
import com.nuc.oa.dao.EmployeeDao;
import com.nuc.oa.dao.LeaveInfoDao;
import com.nuc.oa.dao.LeaveRecordDao;
import com.nuc.oa.entity.Employee;
import com.nuc.oa.entity.LeaveInfo;
import com.nuc.oa.entity.LeaveRecord;
import com.nuc.oa.global.Contant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/7 19:28
 * @Description:
 */
@Service("leaveInfoBiz")
public class LeaveInfoBizImpl implements LeaveInfoBiz {

    @Autowired
    private LeaveInfoDao leaveInfoDao;

    @Autowired
    private LeaveRecordDao leaveRecordDao;

    @Autowired
    private EmployeeDao employeeDao;

    public void save(LeaveInfo leaveInfo) {
        leaveInfo.setCreateTime(new Date());
        leaveInfo.setNextDealSn(leaveInfo.getCreateSn());
        leaveInfo.setStatus(Contant.CREATED);
        System.out.println(leaveInfo.toString());
        leaveInfoDao.insert(leaveInfo);
    }

    public LeaveInfo get(int id) {
        return leaveInfoDao.select(id);
    }

    public List<LeaveRecord> getRecords(int id) {
        return leaveRecordDao.selectByLeave(id);
    }

    public List<LeaveInfo> getForSelf(String id) {
        return leaveInfoDao.selectByCreateSn(id);
    }

    public List<LeaveInfo> getForDeal(String id) {
        return leaveInfoDao.selectByNextDealSn(id);
    }

    public void update(LeaveInfo leaveInfo) {
        System.out.println("leaveInfo.getCreateSn = " + leaveInfo.getCreateSn());
        leaveInfo.setNextDealSn(leaveInfo.getCreateSn());
        leaveInfo.setStatus(Contant.CREATED);
        System.out.println(leaveInfo.toString());
        leaveInfoDao.update(leaveInfo);
    }

    public void submit(int id) {
        LeaveInfo leaveInfo = leaveInfoDao.select(id);
        Employee employee = employeeDao.select(leaveInfo.getCreateSn());

        leaveInfo.setStatus(Contant.SUBMIT);

        if (employee.getPost().equals(Contant.POST_FM)) {
            leaveInfo.setNextDealSn(employeeDao.selectByDepartmentAndPost("10001", Contant.POST_GM).get(0).getSn());
        } else if (employee.getPost().equals(Contant.POST_GM)) {
            leaveInfo.setNextDealSn(employeeDao.selectByDepartmentAndPost(employee.getDepartmentSn(), Contant.POST_HR).get(0).getSn());
        } else {
            leaveInfo.setNextDealSn(employeeDao.selectByDepartmentAndPost(employee.getDepartmentSn(), Contant.POST_FM).get(0).getSn());
        }
        leaveInfoDao.update(leaveInfo);

        LeaveRecord leaveRecord = new LeaveRecord();
        leaveRecord.setLeaveId(id);
        leaveRecord.setDealWay(Contant.DEAL_SUBMIT);
        leaveRecord.setDealSn(employee.getSn());
        leaveRecord.setDealResult(Contant.SUBMIT);
        leaveRecord.setDealTime(new Date());
        leaveRecord.setComment("无");
        leaveRecordDao.insert(leaveRecord);
    }

    public void deal(LeaveRecord leaveRecord) {
        LeaveInfo leaveInfo = leaveInfoDao.select(leaveRecord.getLeaveId());
        Employee employee = employeeDao.select(leaveRecord.getDealSn());
        leaveRecord.setDealTime(new Date());

        if (leaveRecord.getDealWay().equals(Contant.DEAL_PASS)) {
            if (employee.getPost().equals(Contant.POST_FM) || employee.getPost().equals(Contant.POST_GM)){
                // 如果处理人的职位是部门经理或者总经理，则需要HR同意,将下一个处理人设置为 该部门的HR
                leaveInfo.setStatus(Contant.RECHECK);
                leaveInfo.setNextDealSn(employeeDao.selectByDepartmentAndPost(employee.getDepartmentSn(), Contant.POST_HR).get(0).getSn());

                leaveRecord.setDealResult(Contant.RECHECK);
            }else {
                // 如果处理人的职位是人事，则审核结束,将下一位处理人设置为null
                leaveInfo.setStatus(Contant.APPROVED);
                leaveInfo.setNextDealSn(null);

                leaveRecord.setDealResult(Contant.APPROVED);
            }
        } else if (leaveRecord.getDealWay().equals(Contant.DEAL_BACK)) {
            // 如果是打回操作，状态设置为 "已打回"，待处理人设置为请假信息的创建者
            leaveInfo.setStatus(Contant.BACK);
            leaveInfo.setNextDealSn(leaveInfo.getCreateSn());

            leaveRecord.setDealResult(Contant.BACK);
        } else if (leaveRecord.getDealWay().equals(Contant.DEAL_REJECT)) {
            // 如果是拒绝操作，状态设置为 "已终止"，待处理人设置为 null
            leaveInfo.setStatus(Contant.TERMINATED);
            leaveInfo.setNextDealSn(null);

            leaveRecord.setDealResult(Contant.TERMINATED);
        }
        leaveInfoDao.update(leaveInfo);
        leaveRecordDao.insert(leaveRecord);
    }
}
