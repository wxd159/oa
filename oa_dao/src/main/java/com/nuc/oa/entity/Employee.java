package com.nuc.oa.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Employee {
    private String sn;

    private String password;

    private String name;

    private String birthday;

    private String school;

    private String degree;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date endDate;

    private String status;

    private String registrantSn;

    private String IDCard;

    private String address;

    private String remarks;

    private String departmentSn;

    private String post;

    private String dateInfo;

    private String baseSalary;

    private String attendanceNumber;

    private String attendanceBonus;

    private String totalSalary;

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRegistrantSn() {
        return registrantSn;
    }

    public void setRegistrantSn(String registrantSn) {
        this.registrantSn = registrantSn;
    }

    public String getIDCard() {
        return IDCard;
    }

    public void setIDCard(String IDCard) {
        this.IDCard = IDCard;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getDepartmentSn() {
        return departmentSn;
    }

    public void setDepartmentSn(String departmentSn) {
        this.departmentSn = departmentSn;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getDateInfo() {
        return dateInfo;
    }

    public void setDateInfo(String dateInfo) {
        this.dateInfo = dateInfo;
    }

    public String getBaseSalary() {
        return baseSalary;
    }

    public void setBaseSalary(String baseSalary) {
        this.baseSalary = baseSalary;
    }

    public String getAttendanceNumber() {
        return attendanceNumber;
    }

    public void setAttendanceNumber(String attendanceNumber) {
        this.attendanceNumber = attendanceNumber;
    }

    public String getAttendanceBonus() {
        return attendanceBonus;
    }

    public void setAttendanceBonus(String attendanceBonus) {
        this.attendanceBonus = attendanceBonus;
    }

    public String getTotalSalary() {
        return totalSalary;
    }

    public void setTotalSalary(String totalSalary) {
        this.totalSalary = totalSalary;
    }

    private Department department;

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    private Employee registrant;

    public Employee getRegistrant() {
        return registrant;
    }

    public void setRegistrant(Employee registrant) {
        this.registrant = registrant;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "sn='" + sn + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", age='" + birthday + '\'' +
                ", school='" + school + '\'' +
                ", degree='" + degree + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", status='" + status + '\'' +
                ", registrantSn='" + registrantSn + '\'' +
                ", IDCard='" + IDCard + '\'' +
                ", address='" + address + '\'' +
                ", remarks='" + remarks + '\'' +
                ", departmentSn='" + departmentSn + '\'' +
                ", post='" + post + '\'' +
                ", dateInfo='" + dateInfo + '\'' +
                ", baseSalary='" + baseSalary + '\'' +
                ", attendanceNumber='" + attendanceNumber + '\'' +
                ", attendanceBonus='" + attendanceBonus + '\'' +
                ", totalSalary='" + totalSalary + '\'' +
                ", department=" + department +
                ", registrant=" + registrant +
                '}';
    }
}