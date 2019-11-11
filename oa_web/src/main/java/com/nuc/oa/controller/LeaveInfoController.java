package com.nuc.oa.controller;

import com.github.pagehelper.PageHelper;
import com.nuc.oa.biz.LeaveInfoBiz;
import com.nuc.oa.entity.Employee;
import com.nuc.oa.entity.LeaveInfo;
import com.nuc.oa.entity.LeaveRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @Author: cuizhe
 * @Date: 2019/5/7 19:57
 * @Description:
 */
@Controller("leaveInfoController")
@RequestMapping("/leaveInfo")
public class LeaveInfoController {

    @Autowired
    private LeaveInfoBiz leaveInfoBiz;

    @RequestMapping("/to_add")
    public String toAdd(Map<String, Object> map) {
        map.put("leaveInfo", new LeaveInfo());
        return "leave_add";
    }

    @RequestMapping("/add")
    public String add(HttpSession session, LeaveInfo leaveInfo) {
        Employee employee = (Employee) session.getAttribute("employee");
        leaveInfo.setCreateSn(employee.getSn());
        leaveInfoBiz.save(leaveInfo);
        return "redirect:deal";
    }

    @RequestMapping("/deal")
    public String deal(HttpSession session, Map<String, Object> map,
                       @RequestParam(required = true, defaultValue = "1") Integer page) {
        Employee employee = (Employee) session.getAttribute("employee");
        if (page < 1){
            page = 1;
        }
        PageHelper.startPage(page, 8);
        session.setAttribute("pageInfo", page);
        List<LeaveInfo> leaveInfos = leaveInfoBiz.getForDeal(employee.getSn());
        map.put("list", leaveInfos);
        return "leave_deal";
    }

    @RequestMapping("/detail")
    public String detail(int id, Map<String, Object> map) {
        map.put("leaveInfo", leaveInfoBiz.get(id));
        map.put("records", leaveInfoBiz.getRecords(id));
        return "leave_detail";
    }

    @RequestMapping("/to_update")
    public String toUpdate(int id, Map<String, Object> map) {
        LeaveInfo info = leaveInfoBiz.get(id);
        System.out.println("info+++" + info.toString());
        map.put("info", info);
        return "leave_update";
    }

    @RequestMapping("/update")
    public String update(HttpSession session, LeaveInfo info) {
        System.out.println("info = " + info.toString());
        Employee employee = (Employee) session.getAttribute("employee");
        info.setCreateSn(employee.getSn());
        leaveInfoBiz.update(info);
        return "redirect:deal";
    }

    @RequestMapping("/submit")
    public String submit(int id) {
        leaveInfoBiz.submit(id);
        return "redirect:deal";
    }

    @RequestMapping("/to_check")
    public String toCheck(int id, Map<String, Object> map) {
        map.put("leaveInfo", leaveInfoBiz.get(id));
        map.put("records", leaveInfoBiz.getRecords(id));
        LeaveRecord leaveRecord = new LeaveRecord();
        leaveRecord.setLeaveId(id);
        map.put("record", leaveRecord);
        return "leave_check";
    }

    @RequestMapping("/check")
    public String check(HttpSession session, LeaveRecord leaveRecord) {
        Employee employee = (Employee) session.getAttribute("employee");
        leaveRecord.setDealSn(employee.getSn());
        leaveInfoBiz.deal(leaveRecord);
        return "redirect:deal";
    }

    @RequestMapping("/self")
    public String self(HttpSession session, Map<String, Object> map,
                       @RequestParam(required = true, defaultValue = "1") Integer page) {
        Employee employee = (Employee) session.getAttribute("employee");
        if (page < 1){
            page = 1;
        }
        PageHelper.startPage(page, 8);
        session.setAttribute("pageInfo", page);
        List<LeaveInfo> leaveInfos = leaveInfoBiz.getForSelf(employee.getSn());
        map.put("list", leaveInfos);
        return "leave_self";
    }
}
