package com.myuni.wyglsys.service.impl;

import java.util.List;

import com.myuni.wyglsys.dao.IServiceDao;
import com.myuni.wyglsys.entity.Service;
import com.myuni.wyglsys.service.IServiceService;

import javax.annotation.Resource;

@org.springframework.stereotype.Service
public class ServiceServiceImpl implements IServiceService {
    // service的实现类对象交给spring容器自动创建
    @Resource
    IServiceDao serviceDao;

    @Override
    public Service findServiceById(int id) throws Exception {
        return serviceDao.findServiceById(id);
    }

    @Override
    public List<Service> findAllService() throws Exception {
        return serviceDao.findAllService();
    }

    @Override
    public int addService(Service service) throws Exception {
        return serviceDao.addService(service);
    }

    @Override
    public int deleteService(int id) throws Exception {
        return serviceDao.deleteService(id);
    }

    @Override
    public int updateService(Service service) throws Exception {
        return serviceDao.updateService(service);
    }

    @Override
    public List<Service> findServiceByIndex(String type, String content, Double startMoney, Double endMoney,
                                            String startDate, String endDate, Integer state, Integer currentPage, Integer pageSize) throws Exception {
        return serviceDao.findServiceByIndex(type, content, startMoney, endMoney, startDate, endDate, state, currentPage, pageSize);
    }

}
