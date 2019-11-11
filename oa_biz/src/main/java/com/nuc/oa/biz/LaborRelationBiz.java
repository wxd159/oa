package com.nuc.oa.biz;

import com.nuc.oa.entity.LaborRelation;
import com.nuc.oa.entity.LaborRelationRecord;

import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/12 16:14
 * @Description:
 */
public interface LaborRelationBiz {
    void save(LaborRelation laborRelation);

    LaborRelation get(int id);
    List<LaborRelationRecord> getRecords(int id);

    List<LaborRelation> getForSelf(String id);
    List<LaborRelation> getForDeal(String id);

    void update(LaborRelation laborRelation);
    void submit(int id);
    void deal(LaborRelationRecord laborRelationRecord);
}
