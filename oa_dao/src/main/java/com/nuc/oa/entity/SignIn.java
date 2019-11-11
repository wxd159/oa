package com.nuc.oa.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @Author: cuizhe
 * @Date: 2019/5/6 18:57
 * @Description:
 */
public class SignIn {
    private Integer id;

    private String signInSn;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date signInTime;

    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSignInSn() {
        return signInSn;
    }

    public void setSignInSn(String signInSn) {
        this.signInSn = signInSn;
    }

    public Date getSignInTime() {
        return signInTime;
    }

    public void setSignInTime(Date signInTime) {
        this.signInTime = signInTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private Employee employee; // 员工

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Override
    public String toString() {
        return "SignIn{" +
                "id=" + id +
                ", signInSn='" + signInSn + '\'' +
                ", signInTime=" + signInTime +
                ", status='" + status + '\'' +
                ", employee=" + employee +
                '}';
    }
}
