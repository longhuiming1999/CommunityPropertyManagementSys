package com.myuni.wyglsys.entity;

/**
 * @author 龙会铭
 * Description: 报修单实体类
 * 2020年1月9日
 */
public class Repair {
	private int id;
	private int resId;
	private String resname;
	private String phone;
	private String type;
	private String content;
	private String repdate;
	private int state;

	public Repair() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}

	public String getResname() {
		return resname;
	}

	public void setResname(String resname) {
		this.resname = resname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRepdate() {
		return repdate;
	}

	public void setRepdate(String repdate) {
		this.repdate = repdate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Repair [id=" + id + ", resId=" + resId + ", resname=" + resname + ", phone=" + phone + ", type=" + type
				+ ", content=" + content + ", repdate=" + repdate + ", state=" + state + "]";
	}

	public Repair(int id, int resId, String resname, String phone, String type, String content, String repdate,
				  int state) {
		super();
		this.id = id;
		this.resId = resId;
		this.resname = resname;
		this.phone = phone;
		this.type = type;
		this.content = content;
		this.repdate = repdate;
		this.state = state;
	}

}
