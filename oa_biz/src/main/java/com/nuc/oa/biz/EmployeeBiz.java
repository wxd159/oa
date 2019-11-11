package com.nuc.oa.biz;

import com.nuc.oa.entity.Employee;
import com.nuc.oa.entity.Salary;

import java.util.List;

public interface EmployeeBiz {
    boolean add(Employee employee);
    void edit(Employee employee);
    void remove(String sn);
    Employee get(String sn);
    List<Employee> getAll(Integer page);
    List<Employee> selectByName(String name);
    List<Employee> selectByDepartmentAndPost(String dsn, String post);
    List<Salary> selectSalary(String sn);
}
