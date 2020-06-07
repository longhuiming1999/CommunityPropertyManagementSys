package com.myuni.wyglsys.service.impl;

import java.util.List;

import com.myuni.wyglsys.dao.IResidentDao;
import com.myuni.wyglsys.entity.Resident;
import com.myuni.wyglsys.service.IResidentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ResidentServiceImpl implements IResidentService {
    // service的实现类对象交给spring容器自动创建
    @Resource
    IResidentDao residentDao;

    @Override
    public Resident findResidentById(int id) throws Exception {
        return residentDao.findResidentById(id);
    }

    @Override
    public List<Resident> findAllResident() throws Exception {
        return residentDao.findAllResident();
    }

    @Override
    public Resident findResidentByPhone(String phone) throws Exception {
        return residentDao.findResidentByPhone(phone);
    }

    @Override
    public int addResident(Resident resident) throws Exception {
        return residentDao.addResident(resident);
    }

    @Override
    public int deleteResident(int id) throws Exception {
        return residentDao.deleteResident(id);
    }

    @Override
    public int updateResident(Resident resident) throws Exception {
        return residentDao.updateResident(resident);
    }

    @Override
    public List<Resident> findResidentsByIndex(String name, Integer startAge, Integer endAge, String sex, String phone,
                                               String startDate, String endDate, Integer cp, Integer ps) throws Exception {
        return residentDao.findResidentsByIndex(name, startAge, endAge, sex, phone, startDate, endDate, cp, ps);
    }

}
