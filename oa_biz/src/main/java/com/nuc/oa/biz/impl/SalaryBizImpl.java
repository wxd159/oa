package com.nuc.oa.biz.impl;

import com.nuc.oa.biz.SalaryBiz;
import com.nuc.oa.dao.SalaryDao;
import com.nuc.oa.entity.Salary;
import com.nuc.oa.global.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/6/5 16:24
 * @Description:
 */
@Service("salaryBiz")
public class SalaryBizImpl implements SalaryBiz {
    @Autowired
    private SalaryDao salaryDao;

    public List<Salary> init() {
        Calendar cale = Calendar.getInstance();
        int year = cale.get(Calendar.YEAR);
        int month = cale.get(Calendar.MONTH);
        List<Salary> salaries= salaryDao.init();
        String date = year+"年"+month+"月";
        int workdays = DateUtil.getWorkDay(year, month);
        for (Salary salary :
                salaries) {
            salary.setTimes(date);
            if (salary.getSign_in_number() >= workdays) {
                salary.setAttendance_bonus("300");
            }else {
                salary.setAttendance_bonus("0");
            }
            salary.setTotal(String.valueOf(Float.valueOf(salary.getBaseSalary())+Float.valueOf(salary.getAttendance_bonus())));
            salary.setTax(String.valueOf(Float.valueOf(salary.getTotal()) * 0.22));
            salary.setPay(String.valueOf(Float.valueOf(salary.getTotal())-Float.valueOf(salary.getTax())));
        }

        for (Salary salary :
                salaries) {
            System.out.println(salary.toString());
        }
        return salaries;
    }

    public boolean insert(List<Salary> list) {
        if (list == null){
            return false;
        }
        for (Salary salary :
                list) {
            System.out.println(salary.toString());
            salaryDao.insert(salary);
        }
        return true;
    }
}
