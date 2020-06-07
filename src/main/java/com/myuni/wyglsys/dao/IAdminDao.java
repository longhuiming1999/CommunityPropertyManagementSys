package com.myuni.wyglsys.dao;

import com.myuni.wyglsys.entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IAdminDao {
    // 1.根据用户的账号密码查询
    @Select("select account,pwd from tb_adminlogin where account = #{account} and pwd = #{pwd}")
    @ResultType(Admin.class)
    public Admin findUser(@Param("account") String account, @Param("pwd") String pwd) throws Exception;

    // 2.查询所有管理员账号信息
    @Select("select account,pwd from tb_adminlogin")
    List<Admin> findAllUser() throws Exception;
}
