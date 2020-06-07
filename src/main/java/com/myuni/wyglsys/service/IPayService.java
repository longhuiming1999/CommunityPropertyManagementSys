package com.myuni.wyglsys.service;

import java.util.List;

import com.myuni.wyglsys.entity.Pay;

public interface IPayService {
    // 查询
    // 1.根据缴费单的id查询信息
    public Pay findPayById(int id) throws Exception;

    // 2.查询所有缴费单
    public List<Pay> findAllPay() throws Exception;

    // 3.通过业主ID查询业主所有缴费信息
    public List<Pay> findAllPayByResId(int resId) throws Exception;

    // 多重查询
    public List<Pay> findPayByIndex(String resName, String type, Double startMoney, Double endMoney, Integer state, Integer currentPage, Integer pageSize)
            throws Exception;

    // 添加
    // 1.添加缴费单
    public int addPay(Pay pay) throws Exception;

    // 删除
    // 1.根据id删除缴费单
    public int deletePay(int id) throws Exception;

    // 修改
    // 1.根据id修改缴费单的信息
    public int updatePay(Pay pay) throws Exception;
}
