package com.nuc.oa.controller;

import com.github.pagehelper.PageHelper;
import com.nuc.oa.biz.ClaimVoucherBiz;
import com.nuc.oa.dto.ClaimVoucherInfo;
import com.nuc.oa.entity.ClaimVoucher;
import com.nuc.oa.entity.DealRecord;
import com.nuc.oa.entity.Employee;
import com.nuc.oa.global.Contant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller("claimVoucherController")
@RequestMapping("/claim_voucher")
public class ClaimVoucherController {
    @Autowired
    private ClaimVoucherBiz claimVoucherBiz;

    @RequestMapping("/to_add")
    public String toAdd(Map<String, Object> map) {
        map.put("items", Contant.getItems());
        map.put("info", new ClaimVoucherInfo());
        return "claim_voucher_add";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response, HttpSession session, ClaimVoucherInfo info, @RequestParam(value = "file", required = false) MultipartFile file) {
        response.setContentType("text/html;charset=utf-8");
        if (file == null) {
            String msg = "请上传报销凭证";
            pop(response, msg);
            return "redirect:to_add";
        }
        //获取上传文件名,包含后缀
        String originalFilename = file.getOriginalFilename();
        //获取后缀
        String substring = originalFilename.substring(originalFilename.lastIndexOf("."));
        System.out.println("substring = " + substring);
        if (!(".png".equals(substring)||".jpg".equals(substring))){
            String msg = "请上传png或jpg格式";
            pop(response, msg);
            return "to_add";
        }
        //保存的文件名
        String dFileName = UUID.randomUUID() + substring;
        //保存路径
        String path = "D:\\IdeaProjects\\oa\\oa_web\\src\\main\\webapp\\images\\"; // windows上的文件
//        String path = request.getSession().getServletContext().getRealPath("/images/");
        System.out.println("path==" + path);
        // 生成保存文件
        File uploadFile = new File(path + dFileName);
        System.out.println("文件：" + uploadFile);
        System.out.println("文件路径：" + uploadFile.getPath());
        //将上传文件保存到路径
        try {
            file.transferTo(uploadFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Employee employee = (Employee) session.getAttribute("employee");
        info.getClaimVoucher().setPath(dFileName);
        info.getClaimVoucher().setCreateSn(employee.getSn());
        claimVoucherBiz.save(info.getClaimVoucher(), info.getItems());
        return "redirect:deal";
    }

    @RequestMapping("/detail")
    public String detail(int id, Map<String, Object> map) {
        System.out.println(claimVoucherBiz.get(id).getPath());
        map.put("path", claimVoucherBiz.get(id).getPath());
        map.put("claimVoucher", claimVoucherBiz.get(id));
        map.put("items", claimVoucherBiz.getItems(id));
        map.put("records", claimVoucherBiz.getRecords(id));
        return "claim_voucher_detail";
    }

    @RequestMapping("/self")
    public String self(HttpSession session, Map<String, Object> map,
                       @RequestParam(required = true, defaultValue = "1") Integer page) {
        Employee employee = (Employee) session.getAttribute("employee");
        if (page < 1) {
            page = 1;
        }
        PageHelper.startPage(page, 8);
        List<ClaimVoucher> claimVouchers = claimVoucherBiz.getForSelf(employee.getSn());
        map.put("list", claimVouchers);
        session.setAttribute("selfPageInfo", page);
        return "claim_voucher_self";
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
        List<ClaimVoucher> claimVouchers = claimVoucherBiz.getForDeal(employee.getSn());
        map.put("list", claimVouchers);
        return "claim_voucher_deal";
    }

    @RequestMapping("/to_update")
    public String toUpdate(int id, Map<String, Object> map) {
        map.put("items", Contant.getItems());
        ClaimVoucherInfo info = new ClaimVoucherInfo();
        info.setClaimVoucher(claimVoucherBiz.get(id));
        info.setItems(claimVoucherBiz.getItems(id));
        map.put("info", info);
        return "claim_voucher_update";
    }

    @RequestMapping("/update")
    public String update(HttpSession session, ClaimVoucherInfo info) {
        Employee employee = (Employee) session.getAttribute("employee");
        info.getClaimVoucher().setCreateSn(employee.getSn());
        claimVoucherBiz.update(info.getClaimVoucher(), info.getItems());
        return "redirect:deal";
    }

    @RequestMapping("/submit")
    public String submit(int id) {
        claimVoucherBiz.submit(id);
        return "redirect:deal";
    }

    @RequestMapping("/to_check")
    public String toCheck(int id, Map<String, Object> map) {
        map.put("claimVoucher", claimVoucherBiz.get(id));
        map.put("items", claimVoucherBiz.getItems(id));
        map.put("records", claimVoucherBiz.getRecords(id));
        DealRecord dealRecord = new DealRecord();
        dealRecord.setClaimVoucherId(id);
        map.put("path", claimVoucherBiz.get(id).getPath());
        map.put("record", dealRecord);
        return "claim_voucher_check";
    }

    @RequestMapping("/check")
    public String check(HttpSession session, DealRecord dealRecord) {
        Employee employee = (Employee) session.getAttribute("employee");
        dealRecord.setDealSn(employee.getSn());
        claimVoucherBiz.deal(dealRecord);
        return "redirect:deal";
    }

    public void pop(HttpServletResponse response, String message) {
        try {
            PrintWriter out = response.getWriter();
            String msg = "alert( '" + message + "' );location.href='to_add'";
            out.print("<script type='text/javascript'>" + msg + "</script>");
            out.flush();
            out.close();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
    }
}