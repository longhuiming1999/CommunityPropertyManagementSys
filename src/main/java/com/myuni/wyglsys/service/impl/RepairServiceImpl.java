package com.myuni.wyglsys.service.impl;

import java.util.List;

import com.myuni.wyglsys.dao.IRepairDao;
import com.myuni.wyglsys.entity.Repair;
import com.myuni.wyglsys.service.IRepairService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RepairServiceImpl implements IRepairService {
    // service的实现类对象交给spring容器自动创建
    @Resource
    IRepairDao repairDao;

    @Override
    public Repair findRepairById(int id) throws Exception {
        return repairDao.findRepairById(id);
    }

    @Override
    public List<Repair> findAllRepair() throws Exception {
        return repairDao.findAllRepair();
    }

    @Override
    public int addRepair(Repair repair) throws Exception {
        return repairDao.addRepair(repair);
    }

    @Override
    public int deleteRepair(int id) throws Exception {
        return repairDao.deleteRepair(id);
    }

    @Override
    public int updateRepair(Repair repair) throws Exception {
        return repairDao.updateRepair(repair);
    }

    @Override
    public List<Repair> findRepairByIndex(String name, String phone, String type, String content, String startDate,
                                          String endDate, Integer state, Integer currentPage, Integer pageSize) throws Exception {
        return repairDao.findRepairByIndex(name, phone, type, content, startDate, endDate, state, currentPage, pageSize);
    }

}
