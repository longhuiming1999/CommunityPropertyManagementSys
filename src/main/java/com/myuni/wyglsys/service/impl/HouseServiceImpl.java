package com.myuni.wyglsys.service.impl;

import java.util.List;

import com.myuni.wyglsys.dao.IHouseDao;
import com.myuni.wyglsys.entity.House;
import com.myuni.wyglsys.service.IHouseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class HouseServiceImpl implements IHouseService {
    // service的实现类对象交给spring容器自动创建
    @Resource
    IHouseDao houseDao;

    @Override
    public House findHouseById(int id) throws Exception {
        return houseDao.findHouseById(id);
    }

    @Override
    public List<House> findAllHouse() throws Exception {
        return houseDao.findAllHouse();
    }

    @Override
    public List<House> findHouseByResId(int resId) throws Exception {
        // TODO Auto-generated method stub
        return houseDao.findHouseByResId(resId);
    }

    @Override
    public int addHouse(House house) throws Exception {
        return houseDao.addHouse(house);
    }

    @Override
    public int deleteHouse(int id) throws Exception {
        return houseDao.deleteHouse(id);
    }

    @Override
    public int updateHouse(House house) throws Exception {
        return houseDao.updateHouse(house);
    }

    @Override
    public List<House> findHouseByIndex(String buildNum, String unit, String floor, String houseNum, String name,
                                        String phone, Integer currentPage, Integer pageSize) throws Exception {
        return houseDao.findHouseByIndex(buildNum, unit, floor, houseNum, name, phone, currentPage, pageSize);
    }

}
