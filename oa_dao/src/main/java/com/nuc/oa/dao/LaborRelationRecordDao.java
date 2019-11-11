package com.nuc.oa.dao;

import com.nuc.oa.entity.LaborRelationRecord;

import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/12 15:39
 * @Description:
 */
public interface LaborRelationRecordDao {
    void insert(LaborRelationRecord laborRelationRecord);
    List<LaborRelationRecord> selectByLaborRelationRecord(int id);
}
