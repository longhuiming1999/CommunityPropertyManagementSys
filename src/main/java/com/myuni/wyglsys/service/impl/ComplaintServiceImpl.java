package com.myuni.wyglsys.service.impl;

import java.util.List;

import com.myuni.wyglsys.dao.IComplaintDao;
import com.myuni.wyglsys.entity.Complaint;
import com.myuni.wyglsys.service.IComplaintService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ComplaintServiceImpl implements IComplaintService {
    // service的实现类对象交给spring容器自动创建
    @Resource
    IComplaintDao complaintDao;

    @Override
    public Complaint findComplaintById(int id) throws Exception {
        return complaintDao.findComplaintById(id);
    }

    @Override
    public List<Complaint> findAllComplaint() throws Exception {
        return complaintDao.findAllComplaint();
    }

    @Override
    public int addComplaint(Complaint complaint) throws Exception {
        return complaintDao.addComplaint(complaint);
    }

    @Override
    public int deleteComplaint(int id) throws Exception {
        return complaintDao.deleteComplaint(id);
    }

    @Override
    public int updateComplaint(Complaint complaint) throws Exception {
        return complaintDao.updateComplaint(complaint);
    }

    @Override
    public List<Complaint> findComplaintByIndex(String name, String content, String startDate, String endDate,
                                                Integer state, Integer currentPage, Integer pageSize) throws Exception {
        return complaintDao.findComplaintByIndex(name, content, startDate, endDate, state, currentPage, pageSize);
    }

}
