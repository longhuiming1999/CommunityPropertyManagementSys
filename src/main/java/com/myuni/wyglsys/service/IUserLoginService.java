package com.myuni.wyglsys.service;

import java.util.List;

import com.myuni.wyglsys.entity.PageBean;
import com.myuni.wyglsys.entity.UserLogin;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

public interface IUserLoginService {
    // 1.根据用户的账号密码查询
    public UserLogin findUserByAccountAndPwd(String account, String pwd) throws Exception;

    // 2.修改用户的账号密码
    public int updateUserLogin(UserLogin userLogin) throws Exception;

    // 3.根据用户ID查询用户
    public UserLogin findUserLoginById(int id) throws Exception;

    // 4.查询所有用户
    public List<UserLogin> findAllUser() throws Exception;

    // 5.添加一个用户
    public int addUserLogin(UserLogin userLogin) throws Exception;

    // 6.根据用户的账号查询用户
    public UserLogin findUserLoginByAccount(String account) throws Exception;

    // 7.根据用户的手机号查询
    public UserLogin findUserLoginByPhone(String phone) throws Exception;

    // 8.根据id删除用户信息
    public int deleteUserById(int id) throws Exception;

    // 多重查询
    public List<UserLogin> findByIndex(String account, String phone, String email, Integer currentPage, Integer pageSize) throws Exception;

    // 修改账号信息
    boolean updUserLogin(UserLogin userLogin) throws Exception;
}
