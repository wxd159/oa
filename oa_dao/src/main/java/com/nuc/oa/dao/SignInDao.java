package com.nuc.oa.dao;

import com.nuc.oa.entity.SignIn;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: cuizhe
 * @Date: 2019/5/6 19:06
 * @Description:
 */
@Repository("signInDao")
public interface SignInDao {
    List<SignIn> selectBySignInSn(String signInSn);
    void insert(SignIn signIn);
    int selectCheckBySignInSn(@Param("signInSn") String signInSn, @Param("signInTime") String signInTime);
}
