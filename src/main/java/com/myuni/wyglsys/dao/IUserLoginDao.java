package com.myuni.wyglsys.dao;

import java.util.List;

import com.myuni.wyglsys.entity.PageBean;
import com.myuni.wyglsys.entity.UserLogin;
import org.apache.ibatis.annotations.*;

public interface IUserLoginDao {
    // 1.根据用户的账号密码查询
    @Select("select id,account,pwd,phone,email from tb_userLogin where account = #{account} and pwd = #{pwd}")
    @ResultType(UserLogin.class)
    public UserLogin findUser(@Param("account") String account, @Param("pwd") String pwd) throws Exception;

    // 2.修改用户的账号密码
    @Update(" update tb_userLogin set pwd=#{pwd},phone=#{phone},email=#{email} where id = #{id} ")
    @ResultType(int.class)
    public int updUser(UserLogin userLogin) throws Exception;

    // 3.根据用户ID查询用户
    @Select("select id,account,pwd,phone,email from tb_userLogin where id = #{id}")
    @ResultType(UserLogin.class)
    public UserLogin findUserById(@Param("id") int id) throws Exception;

    // 4.查询所有用户
    @Select("select id,account,pwd,phone,email from tb_userLogin")
    @ResultType(UserLogin.class)
    public List<UserLogin> findAllUser() throws Exception;

    // 5.添加一个用户
    @Insert("insert into tb_userLogin (account,pwd,phone,email ) values(#{account},#{pwd},#{phone},#{email})")
    @ResultType(int.class)
    public int addUserLogin(UserLogin userLogin) throws Exception;

    // 6.根据用户的账号查询
    @Select("select id,account,pwd,phone,email from tb_userLogin where account = #{account}")
    @ResultType(UserLogin.class)
    public UserLogin findUserByAccount(@Param("account") String account) throws Exception;

    // 7.根据用户的手机号查询
    @Select("select id,account,pwd,phone,email from tb_userLogin where phone = #{phone}")
    @ResultType(UserLogin.class)
    public UserLogin findUserByPhone(String phone) throws Exception;

    // 8.根据id删除用户信息
    @Delete("delete from tb_userlogin where id = #{id}")
    @ResultType(int.class)
    public int deleteUserById(@Param("id") int id) throws Exception;

    // 多重查询
    public List<UserLogin> findByIndex(@Param("account") String account, @Param("phone") String phone, @Param("email") String email, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize) throws Exception;

    // 修改账号信息
    @Update("update tb_userlogin set pwd = {pwd},email=#{email} where id = #{id}")
    @ResultType(boolean.class)
    boolean updUserLogin(UserLogin userLogin) throws Exception;

}
