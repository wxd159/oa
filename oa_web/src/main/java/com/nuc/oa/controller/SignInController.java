package com.nuc.oa.controller;

import com.github.pagehelper.PageHelper;
import com.nuc.oa.biz.SignInBiz;
import com.nuc.oa.entity.Employee;
import com.nuc.oa.entity.SignIn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * @Author: cuizhe
 * @Date: 2019/5/6 19:25
 * @Description:
 */
@Controller("signInController")
@RequestMapping("/sign_in")
public class SignInController {
    @Autowired
    private SignInBiz signInBiz;

    @RequestMapping("/list")
    public String list(HttpSession session, Map<String, Object> map,
                       @RequestParam(required = true, defaultValue = "1") Integer page) {
        Employee employee = (Employee) session.getAttribute("employee");
        if (page < 1) {
            page = 1;
        }
        PageHelper.startPage(page, 8);
        List<SignIn> signIns = signInBiz.selectBySignInSn(employee.getSn());
        for (SignIn signIn :
                signIns) {
            System.out.println(signIn.toString());
        }
        map.put("list", signIns);
        return "sign_in_list";
    }

    @RequestMapping("/sign")
    public String signIn(HttpSession session, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        Employee employee = (Employee) session.getAttribute("employee");
        boolean flag = signInBiz.signIn(employee.getSn());
        try {
            PrintWriter out = response.getWriter();
            String msg = null;
            if (!flag) {
                msg = "alert( '今天已经签过了！' );location.href='/sign_in/list'";
            } else {
                msg = "alert( '签到成功！' );location.href='/sign_in/list'";
            }
            out.print("<script type='text/javascript'>" + msg + "</script>");
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:list";
    }

}
