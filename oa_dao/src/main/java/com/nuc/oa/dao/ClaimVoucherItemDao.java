package com.nuc.oa.dao;

import com.nuc.oa.entity.ClaimVoucherItem;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("claimVoucherItemDao")
public interface ClaimVoucherItemDao {
    void insert(ClaimVoucherItem claimVoucherItem);
    void update(ClaimVoucherItem claimVoucherItem);
    void delete(int id);
    List<ClaimVoucherItem> selectByClaimVoucher(int cvid);
}
