package com.nuc.oa.biz;

import com.nuc.oa.entity.SignIn;

import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/6 19:15
 * @Description:
 */
public interface SignInBiz {
    List<SignIn> selectBySignInSn(String signInSn);
    boolean signIn(String signInSn);
    boolean hasSignIn(String signInSn,String signInTime);
}
