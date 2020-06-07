package com.myuni.wyglsys.service;

import java.util.List;

import com.myuni.wyglsys.entity.Service;

public interface IServiceService {
    // 查询
    // 1.根据维修单的id查询信息
    public Service findServiceById(int id) throws Exception;

    // 2.查询所有维修单
    public List<Service> findAllService() throws Exception;

    // 添加
    // 1.添加维修单
    public int addService(Service service) throws Exception;

    // 多重查询
    public List<Service> findServiceByIndex(String type, String content, Double startMoney, Double endMoney,
                                            String startDate, String endDate, Integer state, Integer currentPage, Integer pageSize) throws Exception;

    // 删除
    // 1.根据id删除维修单
    public int deleteService(int id) throws Exception;

    // 修改
    // 1.根据id修改维修单的信息
    public int updateService(Service service) throws Exception;
}
