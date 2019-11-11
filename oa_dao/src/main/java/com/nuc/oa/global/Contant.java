package com.nuc.oa.global;

import java.util.ArrayList;
import java.util.List;

public class Contant {
    //职务
    public static final String POST_STAFF = "员工";
    public static final String POST_FM = "部门经理";
    public static final String POST_GM = "总经理";
    public static final String POST_HR = "人事";
    public static final String POST_CASHIER = "财务";

    public static List<String> getPosts() {
        List<String> list = new ArrayList<String>();
        list.add(POST_STAFF);
        list.add(POST_FM);
        list.add(POST_GM);
        list.add(POST_HR);
        list.add(POST_CASHIER);
        return list;
    }

    //员工状态
    public static final String STATUS_NORMAL = "正常";
    public static final String STATUS_RENEWAL = "续约";
    public static final String STATUS_DIMISSION = "离职";


    public static List<String> getStatus(){
        List<String> list = new ArrayList<String>();
        list.add(STATUS_NORMAL);
        list.add(STATUS_RENEWAL);
        list.add(STATUS_DIMISSION);
        return list;
    }

    //学历
    public static final String DEGREE_PRIMARY = "小学";
    public static final String DEGREE_JUNIOR = "初中";
    public static final String DEGREE_SENIOR = "高中";
    public static final String DEGREE_SECONDARY = "中专";
    public static final String DEGREE_SPECIALTY = "大专";
    public static final String DEGREE_BACHELOR = "本科";
    public static final String DEGREE_MASTER = "硕士";
    public static final String DEGREE_DOCTOR = "博士";
    public static final String DEGREE_POSTDOCTOR = "博士后";

    public static List<String> getDegree(){
        List<String> list = new ArrayList<String>();
        list.add(DEGREE_PRIMARY);
        list.add(DEGREE_JUNIOR);
        list.add(DEGREE_SENIOR);
        list.add(DEGREE_SECONDARY);
        list.add(DEGREE_SPECIALTY);
        list.add(DEGREE_BACHELOR);
        list.add(DEGREE_MASTER);
        list.add(DEGREE_DOCTOR);
        list.add(DEGREE_POSTDOCTOR);
        return list;
    }

    //费用类别
    public static List<String> getItems() {
        List<String> list = new ArrayList<String>();
        list.add("交通");
        list.add("餐饮");
        list.add("住宿");
        list.add("办公");
        return list;
    }

    //报销单状态
    public static final String CREATED = "新创建";
    public static final String SUBMIT = "已提交";
    public static final String APPROVED = "已审核";
    public static final String BACK = "已打回";
    public static final String TERMINATED = "已终止";
    public static final String RECHECK = "待复审";
    public static final String PAID = "已打款";
    public static final String AGREE = "已同意";

    //报销单审核额度
    public static final double LIMIT_CHECK = 5000.00;

    //处理方式
    public static final String DEAL_CREATE = "创建";
    public static final String DEAL_SUBMIT = "提交";
    public static final String DEAL_UPDATE = "修改";
    public static final String DEAL_BACK = "打回";
    public static final String DEAL_REJECT = "拒绝";
    public static final String DEAL_PASS = "通过";
    public static final String DEAL_PAID = "打款";

    //考勤状态
    public static final String SIGNIN_LATE = "迟到";
    public static final String SIGNIN_REACH = "正常";


}
