package com.myuni.wyglsys.service;

import java.util.List;

import com.myuni.wyglsys.entity.Complaint;

public interface IComplaintService {
	// 查询
	// 1.根据投诉单的id查询信息
	public Complaint findComplaintById(int id) throws Exception;

	// 2.查询所有投诉单
	public List<Complaint> findAllComplaint() throws Exception;

	// 多重查询
	public List<Complaint> findComplaintByIndex(String name, String content, String startDate, String endDate,
												Integer state,Integer currentPage,Integer pageSize) throws Exception;


	// 添加
	// 1.添加投诉单
	public int addComplaint(Complaint complaint) throws Exception;

	// 删除
	// 1.根据id删除投诉单
	public int deleteComplaint(int id) throws Exception;

	// 修改
	// 1.根据id修改投诉单的信息
	public int updateComplaint(Complaint complaint) throws Exception;
}
