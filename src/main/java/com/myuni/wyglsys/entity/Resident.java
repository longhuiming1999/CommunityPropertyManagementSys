package com.myuni.wyglsys.entity;

/**
 * @author 龙会铭
 * Description: 租户实体类
 * 2020年1月9日
 */
public class Resident {
	private int id;
	private String name;
	private int age;
	private String sex;
	private String phone;
	private String checkInDate;
	private String remark;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCheckInDate() {
		return checkInDate;
	}
	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Resident [id=" + id + ", name=" + name + ", age=" + age + ", sex=" + sex + ", phone=" + phone
				+ ", checkInDate=" + checkInDate + ", remark=" + remark + "]";
	}
	public Resident(int id, String name, int age, String sex, String phone, String checkInDate, String remark) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.sex = sex;
		this.phone = phone;
		this.checkInDate = checkInDate;
		this.remark = remark;
	}
	public Resident() {
		super();
		// TODO Auto-generated constructor stub
	}




}
