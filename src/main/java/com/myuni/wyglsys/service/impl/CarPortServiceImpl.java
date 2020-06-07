package com.myuni.wyglsys.service.impl;

import java.util.List;

import com.myuni.wyglsys.dao.ICarportDao;
import com.myuni.wyglsys.entity.CarPort;
import com.myuni.wyglsys.service.ICarPortService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CarPortServiceImpl implements ICarPortService {
    // service的实现类对象交给spring容器自动创建
    @Resource
    ICarportDao carportDao;

    @Override
    public CarPort findCarPortById(int id) throws Exception {
        return carportDao.findCarPortById(id);
    }

    @Override
    public List<CarPort> findAllCarPort() throws Exception {
        return carportDao.findAllCarPort();
    }

    @Override
    public int addCarPort(CarPort carPort) throws Exception {
        return carportDao.addCarPort(carPort);
    }

    @Override
    public int deleteCarPort(int id) throws Exception {
        return carportDao.deleteCarPort(id);
    }

    @Override
    public int updateCarPort(CarPort carPort) throws Exception {
        return carportDao.updateCarPort(carPort);
    }

    @Override
    public List<CarPort> findCarPortByResId(int resId) throws Exception {
        return carportDao.findCarPortByResId(resId);
    }

    @Override
    public List<CarPort> findCarportByIndex(String resName, String resPlateNum, Double startMoney, Double endMoney,
                                            Integer state, Integer currentPage, Integer pageSize) throws Exception {
        return carportDao.findCarportByIndex(resName, resPlateNum, startMoney, endMoney, state, currentPage, pageSize);
    }

}
