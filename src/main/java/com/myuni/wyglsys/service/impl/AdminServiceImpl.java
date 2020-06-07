package com.myuni.wyglsys.service.impl;

import com.myuni.wyglsys.dao.IAdminDao;
import com.myuni.wyglsys.entity.Admin;
import com.myuni.wyglsys.service.IAdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class AdminServiceImpl implements IAdminService {
    // service的实现类对象交给spring容器自动创建
    @Resource
    IAdminDao adminDao;

    @Override
    public Admin findUser(String account, String pwd) throws Exception {
        return adminDao.findUser(account, pwd);
    }

    @Override
    public List<Admin> findAllUser() throws Exception {
        return adminDao.findAllUser();
    }


}
