package com.nuc.oa.controller;

import com.github.pagehelper.PageHelper;
import com.nuc.oa.biz.DepartmentBiz;
import com.nuc.oa.biz.NoticeBiz;
import com.nuc.oa.entity.Employee;
import com.nuc.oa.entity.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author: cuizhe
 * @Date: 2019/5/8 22:02
 * @Description:
 */
@Controller("noticeController")
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeBiz noticeBiz;

    @RequestMapping("/list")
    public String list(HttpSession session, Map<String, Object> map,
                       @RequestParam(required = true, defaultValue = "1") Integer page) {
        if (page < 1){
            page = 1;
        }
        PageHelper.startPage(page, 8);
        session.setAttribute("pageInfo", page);
        List<Notice> notices = noticeBiz.getAll();
        map.put("list", notices);
        return "notice_list";
    }

    @RequestMapping("/to_add")
    public String toAdd(Map<String, Object> map) {
        map.put("notice", new Notice());
        return "notice_add";
    }

    @RequestMapping("/add")
    public String add(HttpSession session, Notice notice) {
        Employee employee = (Employee) session.getAttribute("employee");
        notice.setCreateSn(employee.getSn());
        notice.setDepartmentSn(employee.getDepartmentSn());
        notice.setCreateTime(new Date());
        System.out.println("notice = " + notice.toString());
        noticeBiz.add(notice);
        return "redirect:list";
    }

    @RequestMapping(value = "/to_update", params = "id")
    public String toUpdate(Integer id, Map<String, Object> map) {
        map.put("notice", noticeBiz.get(id));
        return "notice_update";
    }

    @RequestMapping("/update")
    public String update(Notice notice){
        System.out.println("controller ," + notice.toString());
        noticeBiz.edit(notice);
        return "redirect:list";
    }


    @RequestMapping(value = "/remove", params = "id")
    public String remove(Integer id) {
        noticeBiz.delete(id);
        return "redirect:list";
    }

    @RequestMapping(value = "/detail")
    public String detail(Integer id, Map<String, Object> map) {

        map.put("notice", noticeBiz.get(id));
        return "notice_detail";
    }

}
