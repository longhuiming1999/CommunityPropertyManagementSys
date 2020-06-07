package com.myuni.wyglsys.service;

import com.myuni.wyglsys.entity.Admin;

import java.util.List;

public interface IAdminService {
	// 1.根据用户的账号密码查询
	public Admin findUser(String account, String pwd) throws Exception;

	// 2.查询所有管理员账号信息
	List<Admin> findAllUser() throws Exception;
}
