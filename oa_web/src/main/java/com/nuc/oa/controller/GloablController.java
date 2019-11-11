package com.nuc.oa.controller;

import com.nuc.oa.biz.ClaimVoucherBiz;
import com.nuc.oa.biz.GlobalBiz;
import com.nuc.oa.biz.LaborRelationBiz;
import com.nuc.oa.biz.LeaveInfoBiz;
import com.nuc.oa.entity.Employee;
import com.nuc.oa.global.Contant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Controller("globalController")
public class GloablController {

    @Autowired
    private GlobalBiz globalBiz;

    @Autowired
    private ClaimVoucherBiz claimVoucherBiz;

    @Autowired
    private LaborRelationBiz laborRelationBiz;

    @Autowired
    private LeaveInfoBiz leaveInfoBiz;

    @RequestMapping("/to_login")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/login")
    public String login(HttpServletResponse response,HttpSession session, @RequestParam String sn, @RequestParam String password){
        response.setContentType("text/html;charset=utf-8");
        Employee employee = globalBiz.login(sn,password);
        if (employee == null) {
            String message = "查询不到此用户，请核实账号密码后重新登录！";
            pop(response,message);
            return "redirect:to_login";
        }
        if (!(employee.getStatus().equals(Contant.STATUS_NORMAL) || employee.getStatus().equals(Contant.STATUS_RENEWAL))){
            String message = "您已离职，无法登录公司网页！";
            pop(response,message);
            return "redirect:to_login";
        }
        int claimVoucherNews = claimVoucherBiz.getForDeal(employee.getSn()).size();
        int leaveInfoNews = leaveInfoBiz.getForDeal(employee.getSn()).size();
        int laborRelationNews = laborRelationBiz.getForDeal(employee.getSn()).size();
        System.out.println("报销单 = " + claimVoucherNews + "，请假 = " + leaveInfoNews + "，劳动关系 = " + laborRelationNews);

        session.setAttribute("employee",employee);
        session.setAttribute("claimVoucherNews",claimVoucherNews);
        session.setAttribute("leaveInfoNews",leaveInfoNews);
        session.setAttribute("laborRelationNews",laborRelationNews);
        return "redirect:self";
    }

    public void pop(HttpServletResponse response,String message) {
        try {
            PrintWriter out = response.getWriter();
            String msg = "alert( '"+message+"' );location.href='to_login'";
            out.print("<script type='text/javascript'>" + msg + "</script>");
            out.flush();
            out.close();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
    }

    @RequestMapping("/self")
    public String self(){
        return  "self";
    }

    @RequestMapping("/quit")
    public String quit(HttpSession session){
        session.setAttribute("employee",null);
        return "redirect:to_login";
    }

    @RequestMapping("/to_change_password")
    public String toChangePassword(){
        return "change_password";
    }

    @RequestMapping("/change_password")
    public String changePassword(HttpSession session, @RequestParam String old, @RequestParam String new1 ,@RequestParam String new2){
        Employee employee = (Employee)session.getAttribute("employee");
        if(employee.getPassword().equals(old)){
            if(new1.equals(new2)){
                employee.setPassword(new1);
                globalBiz.changePassword(employee);
                return "redirect:self";
            }
        }
        return "redirect:to_change_password";
    }

}
