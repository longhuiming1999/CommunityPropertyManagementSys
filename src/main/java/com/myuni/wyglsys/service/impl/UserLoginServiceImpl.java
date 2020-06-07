package com.myuni.wyglsys.service.impl;

import java.util.List;

import com.myuni.wyglsys.dao.IUserLoginDao;
import com.myuni.wyglsys.entity.UserLogin;
import com.myuni.wyglsys.service.IUserLoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserLoginServiceImpl implements IUserLoginService {
    // service的实现类对象交给spring容器自动创建
    @Resource
    IUserLoginDao userLoginDao;

    @Override
    public UserLogin findUserByAccountAndPwd(String account, String pwd) throws Exception {
        return userLoginDao.findUser(account, pwd);
    }

    @Override
    public int updateUserLogin(UserLogin userLogin) throws Exception {
        return userLoginDao.updUser(userLogin);
    }

    @Override
    public UserLogin findUserLoginById(int id) throws Exception {
        return userLoginDao.findUserById(id);
    }

    @Override
    public List<UserLogin> findAllUser() throws Exception {
        return userLoginDao.findAllUser();
    }


    @Override
    public int addUserLogin(UserLogin userLogin) throws Exception {
        if (this.findUserLoginById(userLogin.getId()) != null) {
            return -1;
        } else {
            return userLoginDao.addUserLogin(userLogin);
        }

    }

    @Override
    public UserLogin findUserLoginByAccount(String account) throws Exception {
        return userLoginDao.findUserByAccount(account);
    }

    @Override
    public UserLogin findUserLoginByPhone(String phone) throws Exception {
        return userLoginDao.findUserByPhone(phone);
    }

    @Override
    public int deleteUserById(int id) throws Exception {
        return userLoginDao.deleteUserById(id);
    }

    @Override
    public List<UserLogin> findByIndex(String account, String phone, String email, Integer currentPage, Integer pageSize) throws Exception {
        return userLoginDao.findByIndex(account, phone, email, currentPage, pageSize);
    }

    @Override
    public boolean updUserLogin(UserLogin userLogin) throws Exception {
        return userLoginDao.updUserLogin(userLogin);
    }

}
