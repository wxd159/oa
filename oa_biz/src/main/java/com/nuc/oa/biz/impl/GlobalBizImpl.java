package com.nuc.oa.biz.impl;

import com.nuc.oa.biz.GlobalBiz;
import com.nuc.oa.dao.EmployeeDao;
import com.nuc.oa.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("globalBiz")
public class GlobalBizImpl implements GlobalBiz {
    @Autowired
    private EmployeeDao employeeDao;

    public Employee login(String sn, String password) {
        Employee employee = employeeDao.select(sn);
        if(employee!=null&&employee.getPassword().equals(password)){
            return  employee;
        }
        return null;
    }

    public void changePassword(Employee employee) {
        employeeDao.update(employee);
    }
}
