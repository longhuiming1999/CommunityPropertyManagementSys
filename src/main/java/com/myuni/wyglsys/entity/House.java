package com.myuni.wyglsys.entity;

/**
 * @author 龙会铭
 * Description: 房子实体类
 * 2020年1月9日
 */
public class House {
	private int id;
	private String buildNum;
	private String unit;
	private String floor;
	private String houseNum;
	private int resId;
	private String name;
	private String phone;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBuildNum() {
		return buildNum;
	}
	public void setBuildNum(String buildNum) {
		this.buildNum = buildNum;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getHouseNum() {
		return houseNum;
	}
	public void setHouseNum(String houseNum) {
		this.houseNum = houseNum;
	}
	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public House(int id, String buildNum, String unit, String floor, String houseNum, int resId, String name,
				 String phone) {
		super();
		this.id = id;
		this.buildNum = buildNum;
		this.unit = unit;
		this.floor = floor;
		this.houseNum = houseNum;
		this.resId = resId;
		this.name = name;
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "House [id=" + id + ", buildNum=" + buildNum + ", unit=" + unit + ", floor=" + floor + ", houseNum="
				+ houseNum + ", resId=" + resId + ", name=" + name + ", phone=" + phone + "]";
	}
	public House() {
		super();
		// TODO Auto-generated constructor stub
	}

}
