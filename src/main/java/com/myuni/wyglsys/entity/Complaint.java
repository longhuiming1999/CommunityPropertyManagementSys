package com.myuni.wyglsys.entity;

/**
 * @author 龙会铭
 * Description: 投诉单实体类
 * 2020年1月9日
 */
public class Complaint {
	private int id;
	private int resId;
	private String resName;
	private String content;
	private String date;
	private int state;

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

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Complaint [id=" + id + ", resId=" + resId + ", resName=" + resName + ", content=" + content + ", date="
				+ date + ", state=" + state + "]";
	}

	public Complaint(int id, int resId, String resName, String content, String date, int state) {
		super();
		this.id = id;
		this.resId = resId;
		this.resName = resName;
		this.content = content;
		this.date = date;
		this.state = state;
	}

	public Complaint() {
		super();
	}

}
