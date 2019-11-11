package com.nuc.oa.dao;

import com.nuc.oa.entity.Salary;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/6/5 16:03
 * @Description:
 */
@Repository("salaryDao")
public interface SalaryDao {
    List<Salary> init();

    void insert(Salary salary);
}
