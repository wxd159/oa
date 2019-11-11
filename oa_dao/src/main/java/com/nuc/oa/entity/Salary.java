package com.nuc.oa.entity;

import java.math.BigDecimal;

/**
 * @Author: cuizhe
 * @Date: 2019/6/5 15:34
 * @Description:
 */
public class Salary {
    private Integer id;

    private String sn;

    private String name;

    private String times;

    private String baseSalary;

    private int sign_in_number;

    private String attendance_bonus;

    private String total;

    private String tax;

    private String pay;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTimes() {
        return times;
    }

    public void setTimes(String times) {
        this.times = times;
    }

    public String getBaseSalary() {
        return baseSalary;
    }

    public void setBaseSalary(String baseSalary) {
        this.baseSalary = baseSalary;
    }

    public Integer getSign_in_number() {
        return sign_in_number;
    }

    public void setSign_in_number(Integer sign_in_number) {
        this.sign_in_number = sign_in_number;
    }

    public String getAttendance_bonus() {
        return attendance_bonus;
    }

    public void setAttendance_bonus(String attendance_bonus) {
        this.attendance_bonus = attendance_bonus;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getTax() {
        return tax;
    }

    public void setTax(String tax) {
        this.tax = tax;
    }

    public String getPay() {
        return pay;
    }

    public void setPay(String pay) {
        this.pay = pay;
    }

    @Override
    public String toString() {
        return "Salary{" +
                "id=" + id +
                ", sn='" + sn + '\'' +
                ", name='" + name + '\'' +
                ", times='" + times + '\'' +
                ", baseSalary=" + baseSalary +
                ", sign_in_number=" + sign_in_number +
                ", attendance_bonus=" + attendance_bonus +
                ", total=" + total +
                ", tax=" + tax +
                ", pay=" + pay +
                '}';
    }
}
