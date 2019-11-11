package com.nuc.oa.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @Author: cuizhe
 * @Date: 2019/5/12 11:58
 * @Description:
 */
public class LaborRelationRecord {
    private Integer id;

    private Integer laborRelationId;

    private String dealSn;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date dealTime;

    private String dealWay;

    private String dealResult;

    private String comment;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLaborRelationId() {
        return laborRelationId;
    }

    public void setLaborRelationId(Integer laborRelationId) {
        this.laborRelationId = laborRelationId;
    }

    public String getDealSn() {
        return dealSn;
    }

    public void setDealSn(String dealSn) {
        this.dealSn = dealSn;
    }

    public Date getDealTime() {
        return dealTime;
    }

    public void setDealTime(Date dealTime) {
        this.dealTime = dealTime;
    }

    public String getDealWay() {
        return dealWay;
    }

    public void setDealWay(String dealWay) {
        this.dealWay = dealWay;
    }

    public String getDealResult() {
        return dealResult;
    }

    public void setDealResult(String dealResult) {
        this.dealResult = dealResult;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    private Employee dealer; // 处理人

    public Employee getDealer() {
        return dealer;
    }

    public void setDealer(Employee dealer) {
        this.dealer = dealer;
    }

    @Override
    public String toString() {
        return "LaborRelationRecord{" +
                "id=" + id +
                ", LaborRelationId=" + laborRelationId +
                ", dealSn='" + dealSn + '\'' +
                ", dealTime=" + dealTime +
                ", dealWay='" + dealWay + '\'' +
                ", dealResult='" + dealResult + '\'' +
                ", comment='" + comment + '\'' +
                ", dealer=" + dealer +
                '}';
    }
}
