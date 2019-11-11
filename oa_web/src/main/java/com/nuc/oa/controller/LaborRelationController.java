package com.nuc.oa.controller;

import com.github.pagehelper.PageHelper;
import com.nuc.oa.biz.LaborRelationBiz;
import com.nuc.oa.entity.Employee;
import com.nuc.oa.entity.LaborRelation;
import com.nuc.oa.entity.LaborRelationRecord;
import com.nuc.oa.global.Contant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @Author: cuizhe
 * @Date: 2019/5/12 16:14
 * @Description:
 */
@Controller("laborRelationController")
@RequestMapping("/labor_relation")
public class LaborRelationController {

    @Autowired
    private LaborRelationBiz laborRelationBiz;

    @RequestMapping("/to_add")
    public String toAdd(Map<String, Object> map) {
        map.put("labor_relation", new LaborRelation());
        map.put("slist", Contant.getStatus());
        return "labor_relation_add";
    }

    @RequestMapping("/add")
    public String add(HttpSession session, LaborRelation laborRelation) {
        Employee employee = (Employee) session.getAttribute("employee");
        laborRelation.setCreateSn(employee.getSn());
        laborRelationBiz.save(laborRelation);
        return "redirect:deal";
    }

    @RequestMapping("/deal")
    public String deal(HttpSession session, Map<String, Object> map,
                       @RequestParam(required = true, defaultValue = "1") Integer page) {
        Employee employee = (Employee) session.getAttribute("employee");
        if (page < 1) {
            page = 1;
        }
        PageHelper.startPage(page, 8);
        session.setAttribute("pageInfo", page);
        List<LaborRelation> laborRelations = laborRelationBiz.getForDeal(employee.getSn());
        map.put("list", laborRelations);
        return "labor_relation_deal";
    }

    @RequestMapping("/detail")
    public String detail(int id, Map<String, Object> map) {
        map.put("labor_relation", laborRelationBiz.get(id));
        map.put("records", laborRelationBiz.getRecords(id));
        return "labor_relation_detail";
    }

    @RequestMapping("/to_update")
    public String toUpdate(int id, Map<String, Object> map) {
        LaborRelation laborRelation = laborRelationBiz.get(id);
        System.out.println("info+++" + laborRelation.toString());
        map.put("slist", Contant.getStatus());
        map.put("labor_relation", laborRelation);
        return "labor_relation_update";
    }

    @RequestMapping("/update")
    public String update(HttpSession session, LaborRelation laborRelation) {
        System.out.println("info = " + laborRelation.toString());
        Employee employee = (Employee) session.getAttribute("employee");
        laborRelation.setCreateSn(employee.getSn());
        laborRelationBiz.update(laborRelation);
        return "redirect:deal";
    }

    @RequestMapping("/submit")
    public String submit(int id) {
        laborRelationBiz.submit(id);
        return "redirect:deal";
    }

    @RequestMapping("/to_check")
    public String toCheck(int id, Map<String, Object> map) {
        map.put("labor_relation", laborRelationBiz.get(id));
        map.put("records", laborRelationBiz.getRecords(id));
        LaborRelationRecord laborRelationRecord = new LaborRelationRecord();
        laborRelationRecord.setLaborRelationId(id);
        System.out.println(laborRelationRecord.toString());
        map.put("record", laborRelationRecord);
        return "labor_relation_check";
    }

    @RequestMapping("/check")
    public String check(HttpSession session, LaborRelationRecord leaveRecord) {
        Employee employee = (Employee) session.getAttribute("employee");
        leaveRecord.setDealSn(employee.getSn());
        System.out.println(leaveRecord.toString());
        laborRelationBiz.deal(leaveRecord);
        return "redirect:deal";
    }

    @RequestMapping("/self")
    public String self(HttpSession session, Map<String, Object> map,
                       @RequestParam(required = true, defaultValue = "1") Integer page) {
        Employee employee = (Employee) session.getAttribute("employee");
        if (page < 1) {
            page = 1;
        }
        PageHelper.startPage(page, 8);
        session.setAttribute("pageInfo", page);
        List<LaborRelation> laborRelations = laborRelationBiz.getForSelf(employee.getSn());
        map.put("list", laborRelations);
        return "labor_relation_self";
    }

}
