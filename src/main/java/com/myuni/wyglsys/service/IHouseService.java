package com.myuni.wyglsys.service;

import java.util.List;

import com.myuni.wyglsys.entity.House;

public interface IHouseService {
    // 查询
    // 1.根据房子的id查询房产的信息
    public House findHouseById(int id) throws Exception;

    // 2.查询物业公司所有房产
    public List<House> findAllHouse() throws Exception;

    // 3.根据业主id查询房子信息
    public List<House> findHouseByResId(int resId) throws Exception;

    // 4.根据条件筛选房子
    public List<House> findHouseByIndex(String buildNum, String unit, String floor, String houseNum, String name,
                                        String phone, Integer currentPage, Integer pageSize) throws Exception;

    // 添加
    // 1.登记房产（添加房产）
    public int addHouse(House house) throws Exception;

    // 删除
    // 1.根据id注销房产（删除房子的信息）
    public int deleteHouse(int id) throws Exception;

    // 修改
    // 1.根据id修改房产的信息
    public int updateHouse(House house) throws Exception;
}
