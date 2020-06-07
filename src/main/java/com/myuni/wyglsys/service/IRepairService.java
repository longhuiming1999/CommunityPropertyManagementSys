package com.myuni.wyglsys.service;

import java.util.List;

import com.myuni.wyglsys.entity.Repair;

public interface IRepairService {
    // 查询
    // 1.根据报修单的id查询信息
    public Repair findRepairById(int id) throws Exception;

    // 2.查询所有报修单
    public List<Repair> findAllRepair() throws Exception;

    // 多重查询
    public List<Repair> findRepairByIndex(String name, String phone, String type, String content, String startDate,
                                          String endDate, Integer state, Integer currentPage, Integer pageSize) throws Exception;

    // 添加
    // 1.添加报修单
    public int addRepair(Repair repair) throws Exception;

    // 删除
    // 1.根据id删除报修单
    public int deleteRepair(int id) throws Exception;

    // 修改
    // 1.根据id修改报修单的信息
    public int updateRepair(Repair repair) throws Exception;
}
