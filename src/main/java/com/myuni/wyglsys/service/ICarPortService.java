package com.myuni.wyglsys.service;

import java.util.List;

import com.myuni.wyglsys.entity.CarPort;

public interface ICarPortService {
    // 查询
    // 1.根据车位信息单的id查询信息
    public CarPort findCarPortById(int id) throws Exception;

    // 2.查询所有车位信息单
    public List<CarPort> findAllCarPort() throws Exception;

    // 根据业主ID查询
    public List<CarPort> findCarPortByResId(int resId) throws Exception;

    // 3.多重查询
    public List<CarPort> findCarportByIndex(String resName, String resPlateNum, Double startMoney, Double endMoney,
                                            Integer state, Integer currentPage, Integer pageSize) throws Exception;

    // 添加
    // 1.添加车位信息单
    public int addCarPort(CarPort carPort) throws Exception;

    // 删除
    // 1.根据id删除车位信息单
    public int deleteCarPort(int id) throws Exception;

    // 修改
    // 1.根据id修改车位信息单的信息
    public int updateCarPort(CarPort carPort) throws Exception;
}
