package com.nuc.oa.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @Author: cuizhe
 * @Date: 2019/5/12 11:58
 * @Description:
 */
public class LaborRelation {
    private Integer id;

    private String item;

    private String cause;

    private String createSn;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    private String nextDealSn;

    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public String getCreateSn() {
        return createSn;
    }

    public void setCreateSn(String createSn) {
        this.createSn = createSn;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getNextDealSn() {
        return nextDealSn;
    }

    public void setNextDealSn(String nextDealSn) {
        this.nextDealSn = nextDealSn;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private Employee creater; // 创建者

    private Employee dealer; // 处理人

    public Employee getCreater() {
        return creater;
    }

    public void setCreater(Employee creater) {
        this.creater = creater;
    }

    public Employee getDealer() {
        return dealer;
    }

    public void setDealer(Employee dealer) {
        this.dealer = dealer;
    }

    @Override
    public String toString() {
        return "LaborRelation{" +
                "id=" + id +
                ", item='" + item + '\'' +
                ", cause='" + cause + '\'' +
                ", createSn='" + createSn + '\'' +
                ", createTime=" + createTime +
                ", nextDealSn='" + nextDealSn + '\'' +
                ", status='" + status + '\'' +
                ", creater=" + creater +
                ", dealer=" + dealer +
                '}';
    }
}
