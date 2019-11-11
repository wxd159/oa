package com.nuc.oa.biz.impl;

import com.nuc.oa.biz.SignInBiz;
import com.nuc.oa.dao.SignInDao;
import com.nuc.oa.entity.SignIn;
import com.nuc.oa.global.Contant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/6 19:16
 * @Description:
 */
@Service("signInBiz")
public class SignInBizImpl implements SignInBiz {
    @Autowired
    private SignInDao signInDao;

    public List<SignIn> selectBySignInSn(String signInSn) {
        return signInDao.selectBySignInSn(signInSn);
    }

    public boolean signIn(String signInSn) {
        System.out.println("signInSn = "+signInSn);
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = simpleDateFormat.format(date);
        if (hasSignIn(signInSn,strDate)){
            return false;
        }
        SignIn sign = new SignIn();
        try {
            DateFormat simDate = new SimpleDateFormat("HH:mm:ss");//设置日期格式
            String nowDate = simDate.format(new Date());
            Date curTime = simDate.parse(nowDate);
            Date signInTime = simDate.parse("9:00:00");

            if (curTime.getTime() > signInTime.getTime()) {
                sign.setStatus(Contant.SIGNIN_LATE);
            } else {
                sign.setStatus(Contant.SIGNIN_REACH);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        sign.setSignInTime(new Date());
        sign.setSignInSn(signInSn);
        signInDao.insert(sign);
        return true;
    }

    public boolean hasSignIn(String signInSn,String signInTime) {
        int res = 0;
        res = signInDao.selectCheckBySignInSn(signInSn,signInTime);
        if (res != 0) {
            return true;
        }
        return false;
    }
}
