package com.nuc.oa.biz.impl;

import com.nuc.oa.biz.LaborRelationBiz;
import com.nuc.oa.dao.EmployeeDao;
import com.nuc.oa.dao.LaborRelationDao;
import com.nuc.oa.dao.LaborRelationRecordDao;
import com.nuc.oa.entity.Employee;
import com.nuc.oa.entity.LaborRelation;
import com.nuc.oa.entity.LaborRelationRecord;
import com.nuc.oa.global.Contant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/12 16:14
 * @Description:
 */
@Service("laborRelationBiz")
public class LaborRelationBizImpl implements LaborRelationBiz {

    @Autowired
    private LaborRelationDao laborRelationDao;

    @Autowired
    private LaborRelationRecordDao laborRelationRecordDao;

    @Autowired
    private EmployeeDao employeeDao;


    public void save(LaborRelation laborRelation) {
        laborRelation.setCreateTime(new Date());
        laborRelation.setNextDealSn(laborRelation.getCreateSn());
        laborRelation.setStatus(Contant.CREATED);
        System.out.println(laborRelation.toString());
        laborRelationDao.insert(laborRelation);
    }

    public LaborRelation get(int id) {
        LaborRelation laborRelation = laborRelationDao.select(id);
        System.out.println(laborRelation.toString());
        return laborRelation;
    }

    public List<LaborRelationRecord> getRecords(int id) {
        return laborRelationRecordDao.selectByLaborRelationRecord(id);
    }

    public List<LaborRelation> getForSelf(String id) {
        return laborRelationDao.selectByCreateSn(id);
    }

    public List<LaborRelation> getForDeal(String id) {
        return laborRelationDao.selectByNextDealSn(id);
    }

    public void update(LaborRelation laborRelation) {
        laborRelation.setNextDealSn(laborRelation.getCreateSn());
        laborRelation.setStatus(Contant.CREATED);
        System.out.println(laborRelation.toString());
        laborRelationDao.update(laborRelation);
    }

    public void submit(int id) {
        LaborRelation laborRelation = laborRelationDao.select(id);
        Employee employee = employeeDao.select(laborRelation.getCreateSn());
        laborRelation.setStatus(Contant.SUBMIT);

        if (employee.getPost().equals(Contant.POST_FM)) {
            laborRelation.setNextDealSn(employeeDao.selectByDepartmentAndPost("10001", Contant.POST_GM).get(0).getSn());
        } else if (employee.getPost().equals(Contant.POST_GM)) {
            laborRelation.setNextDealSn(employee.getRegistrantSn());
        } else {
            laborRelation.setNextDealSn(employeeDao.selectByDepartmentAndPost(employee.getDepartmentSn(), Contant.POST_FM).get(0).getSn());
        }
        laborRelationDao.update(laborRelation);

        LaborRelationRecord laborRelationRecord = new LaborRelationRecord();
        laborRelationRecord.setLaborRelationId(id);
        laborRelationRecord.setDealWay(Contant.DEAL_SUBMIT);
        laborRelationRecord.setDealSn(employee.getSn());
        laborRelationRecord.setDealResult(Contant.SUBMIT);
        laborRelationRecord.setDealTime(new Date());
        laborRelationRecord.setComment("无");
        laborRelationRecordDao.insert(laborRelationRecord);
    }

    public void deal(LaborRelationRecord laborRelationRecord) {
        LaborRelation laborRelation = laborRelationDao.select(laborRelationRecord.getLaborRelationId());
        Employee employee = employeeDao.select(laborRelationRecord.getDealSn());
        laborRelationRecord.setDealTime(new Date());

        if (laborRelationRecord.getDealWay().equals(Contant.DEAL_PASS)) {
            if (employee.getPost().equals(Contant.POST_FM) || employee.getPost().equals(Contant.POST_GM)){
                // 如果处理人的职位是部门经理或者总经理，则需要HR同意,将下一个处理人设置为 该部门的HR
                laborRelation.setStatus(Contant.RECHECK);
                laborRelation.setNextDealSn(employee.getRegistrantSn());

                laborRelationRecord.setDealResult(Contant.RECHECK);
            }else {
                // 如果处理人的职位是人事，则审核结束,将下一位处理人设置为 null
                laborRelation.setStatus(Contant.APPROVED);
                laborRelation.setNextDealSn(null);

                laborRelationRecord.setDealResult(Contant.APPROVED);
            }
        } else if (laborRelationRecord.getDealWay().equals(Contant.DEAL_BACK)) {
            // 如果是打回操作，状态设置为 "已打回"，待处理人设置为请假信息的创建者
            laborRelation.setStatus(Contant.BACK);
            laborRelation.setNextDealSn(laborRelation.getCreateSn());

            laborRelationRecord.setDealResult(Contant.BACK);
        } else if (laborRelationRecord.getDealWay().equals(Contant.DEAL_REJECT)) {
            // 如果是拒绝操作，状态设置为 "已终止"，待处理人设置为 null
            laborRelation.setStatus(Contant.TERMINATED);
            laborRelation.setNextDealSn(null);

            laborRelationRecord.setDealResult(Contant.TERMINATED);
        }
        laborRelationDao.update(laborRelation);
        laborRelationRecordDao.insert(laborRelationRecord);
    }
}
