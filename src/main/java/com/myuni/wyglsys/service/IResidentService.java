package com.myuni.wyglsys.service;

import java.util.List;

import com.myuni.wyglsys.entity.Resident;

public interface IResidentService {
    // 查询
    // 1.根据业主的id查询业主的信息
    public Resident findResidentById(int id) throws Exception;

    // 2.查询所有业主
    public List<Resident> findAllResident() throws Exception;

    // 3.根据业主的手机号码查询业主的信息
    public Resident findResidentByPhone(String phone) throws Exception;

    // 多重条件查询
    public List<Resident> findResidentsByIndex(String name, Integer startAge, Integer endAge, String sex, String phone,
                                               String startDate, String endDate, Integer cp, Integer ps) throws Exception;

    // 添加
    // 1.登记业主（添加业主）
    public int addResident(Resident resident) throws Exception;

    // 删除
    // 1.根据id注销业主（删除业主的信息）
    public int deleteResident(int id) throws Exception;

    // 修改
    // 1.根据id修改业主的信息
    public int updateResident(Resident resident) throws Exception;
}
