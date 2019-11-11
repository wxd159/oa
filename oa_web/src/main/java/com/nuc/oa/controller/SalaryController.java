package com.nuc.oa.controller;

import com.github.pagehelper.PageHelper;
import com.nuc.oa.biz.SalaryBiz;
import com.nuc.oa.entity.Salary;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

/**
 * @Author: cuizhe
 * @Date: 2019/6/5 15:33
 * @Description:
 */
@Controller("salaryController")
@RequestMapping("/salary")
public class SalaryController {

    @Autowired
    private SalaryBiz salaryBiz;

    @RequestMapping("/to_manage")
    public String to_manage() {
        return "salary_manage";
    }

    @RequestMapping("/manage")
    public String manage(HttpSession session, Map<String, Object> map,
                         @RequestParam(required = true, defaultValue = "1") Integer page) {
        if (page < 1) {
            page = 1;
        }
        PageHelper.startPage(page, 8);
        session.setAttribute("pageInfo", page);
        List<Salary> salaries = salaryBiz.init();
        map.put("list", salaries);
        return "salary_manage";
    }

    @RequestMapping("/insert")
    public String insert(HttpServletResponse response, Map<String, Object> map) {
        response.setContentType("text/html;charset=utf-8");
        List<Salary> list = salaryBiz.init();
        if (salaryBiz.insert(list)) {
            String message = "工资单确认成功！";
            pop(response, message);
            return "redirect:to_manage";
        } else {
            String message = "工资单确认失败！请检查网络连接";
            pop(response, message);
            return "redirect:to_manage";
        }
    }

    public void pop(HttpServletResponse response, String message) {
        try {
            PrintWriter out = response.getWriter();
            String msg = "alert( '" + message + "' );location.href='to_manage'";
            out.print("<script type='text/javascript'>" + msg + "</script>");
            out.flush();
            out.close();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
    }

    @RequestMapping("/export")
    public String exportFile(HttpServletResponse response, Map<String, Object> map) {
        response.setContentType("text/html;charset=utf-8");
        String filePath = export();
        Calendar cale = Calendar.getInstance();
        int year = cale.get(Calendar.YEAR);
        int month = cale.get(Calendar.MONTH);
        String date = year + "年" + month + "月";
        String fileName = date + "员工工资明细.xls";
        File file = new File(filePath);

        if (file.exists()) {
            FileInputStream fis = null; //文件输入流
            BufferedInputStream bis = null;

            OutputStream os = null; //输出流
            try {
                String realFileName = fileName;
                response.setContentType("application/force-download");
                response.setHeader("Content-disposition",
                        "attachment; filename=" + new String(realFileName.getBytes(StandardCharsets.UTF_8), "ISO8859-1"));

                byte[] buffer = new byte[1024];

                os = response.getOutputStream();
                fis = new FileInputStream(file);
                bis = new BufferedInputStream(fis);
                int i = bis.read(buffer);
                while (i != -1) {
                    os.write(buffer);
                    i = bis.read(buffer);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println("----------file download:" + fileName);
            try {
                bis.close();
                fis.close();
                map.put("result", "success");
                return "redirect:manage";
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public String export() {
        List<Salary> list = salaryBiz.init();
        String[] title = {"工号", "姓名", "日期", "基础工资", "出勤次数", "出勤奖金", "总计", "税金", "实发工资"};
        //创建 EXCEL 文件
        Calendar cale = Calendar.getInstance();
        int year = cale.get(Calendar.YEAR);
        int month = cale.get(Calendar.MONTH);
        String date = year + "年" + month + "月";
        String fileName = date + "员工工资明细.xls";
        String filePath = "C:\\Users\\qiuqian\\Desktop\\" + fileName;
        File file = new File(filePath);//创建文件到 D 盘
        try {
            file.createNewFile();
            // 创建工作簿
            WritableWorkbook workbook = Workbook.createWorkbook(file);
            // 创建sheet
            WritableSheet sheet = workbook.createSheet("sheet1", 0);

            Label label = null;

            for (int i = 0; i < title.length; i++) {
                // 第一行设置列名
                label = new Label(i, 0, title[i]);// 没有行的概念，只有坐标，第i列，第0行，名称
                sheet.addCell(label);
            }

            // 追加数据
            for (int i = 1; i < list.size(); i++) {
                label = new Label(0, i, list.get(i).getSn());
                sheet.addCell(label);
                label = new Label(1, i, list.get(i).getName());
                sheet.addCell(label);
                label = new Label(2, i, list.get(i).getTimes());
                sheet.addCell(label);
                label = new Label(3, i, list.get(i).getBaseSalary());
                sheet.addCell(label);
                label = new Label(4, i, String.valueOf(list.get(i).getSign_in_number()));
                sheet.addCell(label);
                label = new Label(5, i, list.get(i).getAttendance_bonus());
                sheet.addCell(label);
                label = new Label(6, i, list.get(i).getTotal());
                sheet.addCell(label);
                label = new Label(7, i, list.get(i).getTax());
                sheet.addCell(label);
                label = new Label(8, i, list.get(i).getPay());
                sheet.addCell(label);
            }
            //写入数据
            workbook.write();
            //关闭连接
            workbook.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (RowsExceededException e) {
            e.printStackTrace();
        } catch (WriteException e) {
            e.printStackTrace();
        }
        return filePath;
    }
}
