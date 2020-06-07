package com.myuni.wyglsys.entity;

/**
 * @author 龙会铭
 * Description: 维修单实体类
 * 2020年1月9日
 */
public class Service {
	private int id;
	private String type;
	private String content;
	private double cost;
	private String date;
	private int state;

	public Service() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Service(int id, String type, String content, double cost, String date, int state) {
		super();
		this.id = id;
		this.type = type;
		this.content = content;
		this.cost = cost;
		this.date = date;
		this.state = state;
	}

	@Override
	public String toString() {
		return "Service [id=" + id + ", type=" + type + ", content=" + content + ", cost=" + cost + ", date=" + date
				+ ", state=" + state + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
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
}
