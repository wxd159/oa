package com.nuc.oa.biz;

import com.nuc.oa.entity.Salary;

import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/6/5 16:23
 * @Description:
 */
public interface SalaryBiz {
    List<Salary> init();

    boolean insert(List<Salary> list);
}
