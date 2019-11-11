package com.nuc.oa.dao;

import com.nuc.oa.entity.LaborRelation;

import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/12 15:34
 * @Description:
 */
public interface LaborRelationDao {
    void insert(LaborRelation laborRelation);
    void update(LaborRelation leaveInfo);
    void delete(int id);
    LaborRelation select(int id);
    List<LaborRelation> selectByCreateSn(String csn);
    List<LaborRelation> selectByNextDealSn(String ndsn);
}
