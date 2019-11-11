package com.nuc.oa.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nuc.oa.biz.DepartmentBiz;
import com.nuc.oa.biz.EmployeeBiz;
import com.nuc.oa.entity.Employee;
import com.nuc.oa.entity.Salary;
import com.nuc.oa.global.Contant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@Controller("employeeController")
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private DepartmentBiz departmentBiz;
    @Autowired
    private EmployeeBiz employeeBiz;

    @RequestMapping("/list")
    public String list(Map<String, Object> map, HttpSession session,
                       @RequestParam(required = true, defaultValue = "1") Integer page) {
        if (page < 1){
            page = 1;
        }
        PageHelper.startPage(page, 8);
        List<Employee> employees = employeeBiz.getAll(page);
        map.put("list", employees);
        session.setAttribute("pageInfo", page);
        return "employee_list";
    }

    @RequestMapping("/to_add")
    public String toAdd(Map<String, Object> map) {
        map.put("employee", new Employee());
        map.put("dlist", departmentBiz.getAll());
        map.put("plist", Contant.getPosts());
        map.put("degreelist", Contant.getDegree());
        map.put("slist", Contant.getStatus());
        return "employee_add";
    }

    @RequestMapping("/add")
    public String add(HttpSession session, Employee employee, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        Employee registrant = (Employee) session.getAttribute("employee");
        employee.setRegistrantSn(registrant.getSn());
        try {
            if (!employeeBiz.add(employee)) {
                pop(response);
            }
        } catch (Exception e) {
            pop(response);
        }
        return "redirect:list";
    }

    public void pop(HttpServletResponse response) {
        try {
            PrintWriter out = response.getWriter();
            String msg = "alert( '信息有误，请确认信息后重新输入！' );location.href='/employee/list'";
            out.print("<script type='text/javascript'>" + msg + "</script>");
            out.flush();
            out.close();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
    }

    @RequestMapping(value = "/to_update", params = "sn")
    public String toUpdate(String sn, Map<String, Object> map) {
        map.put("employee", employeeBiz.get(sn));
        map.put("dlist", departmentBiz.getAll());
        map.put("plist", Contant.getPosts());
        map.put("degreelist", Contant.getDegree());
        map.put("slist", Contant.getStatus());
        return "employee_update";
    }

    @RequestMapping("/update")
    public String update(Employee employee) {
        employeeBiz.edit(employee);
        return "redirect:list";
    }

    @RequestMapping(value = "/remove", params = "sn")
    public String remove(String sn) {
        employeeBiz.remove(sn);
        return "redirect:list";
    }

    @RequestMapping("/salary")
    public String getSalary(HttpSession session, Map<String, Object> map,
                            @RequestParam(required = true, defaultValue = "1") Integer page) {
        Employee employee = (Employee) session.getAttribute("employee");
        if (page < 1){
            page = 1;
        }
        PageHelper.startPage(page, 8);
        List<Salary> salaries = employeeBiz.selectSalary(employee.getSn());
        map.put("list", salaries);
        session.setAttribute("pageInfo", page);
        return "salary_list";
    }

    @RequestMapping("/to_self")
    public String self(HttpSession session, Map<String, Object> map) {
        Employee employee = (Employee) session.getAttribute("employee");
        map.put("employee", employee);
        map.put("degreelist", Contant.getDegree());
        return "employee_update_self";
    }

    @RequestMapping("/update_self")
    public String updateSelf(Employee employee) {
        employeeBiz.edit(employee);
        return "redirect:list";
    }

    @RequestMapping(value = "/search", params = "name")
    public String search(String name, Map<String, Object> map) {
        map.put("list", employeeBiz.selectByName(name));
        return "employee_list";
    }
}
