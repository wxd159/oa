package com.nuc.oa.biz.impl;

import com.nuc.oa.biz.EmployeeBiz;
import com.nuc.oa.dao.EmployeeDao;
import com.nuc.oa.entity.Employee;
import com.nuc.oa.entity.Salary;
import com.nuc.oa.global.Contant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("employeeBiz")
public class EmployeeBizImpl implements EmployeeBiz {

    @Qualifier("employeeDao")
    @Autowired
    private EmployeeDao employeeDao;

    public boolean add(Employee employee) {
        if (employee.getPost().equals(Contant.POST_FM)) {
            int res = employeeDao.selectByDepartmentAndPost(employee.getDepartmentSn(), employee.getPost()).size();
            if (res != 0) {
                return false;
            }
        }
        employee.setPassword("000000");
        employeeDao.insert(employee);
        return true;
    }

    public void edit(Employee employee) {
        employeeDao.update(employee);
    }

    public void remove(String sn) {
        employeeDao.delete(sn);
    }

    public Employee get(String sn) {
        return employeeDao.select(sn);
    }

    public List<Employee> getAll(Integer page) {
        return employeeDao.selectAll(page);
    }

    public List<Employee> selectByDepartmentAndPost(String dsn, String post) {
        return employeeDao.selectByDepartmentAndPost(dsn, post);
    }

    public List<Salary> selectSalary(String sn) {
        List<Salary> list = employeeDao.selectSalary(sn);
        for (Salary salary :
                list) {
            System.out.println(salary.toString());
        }
        return employeeDao.selectSalary(sn);
    }

    public List<Employee> selectByName(String name) {
        return employeeDao.selectByName(name);
    }
}
