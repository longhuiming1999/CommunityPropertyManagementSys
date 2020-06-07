package com.myuni.wyglsys.entity;

/**
 * @author 龙会铭 Description: 缴费单实体类 2020年1月9日
 */
public class Pay {
	private int payId;
	private int resId;
	private String resName;
	private String type;
	private double money;
	private int state;

	public Pay() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPayId() {
		return payId;
	}

	public void setPayId(int payId) {
		this.payId = payId;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Pay [payId=" + payId + ", resId=" + resId + ", resName=" + resName + ", type=" + type + ", money="
				+ money + ", state=" + state + "]";
	}

	public Pay(int payId, int resId, String resName, String type, double money, int state) {
		super();
		this.payId = payId;
		this.resId = resId;
		this.resName = resName;
		this.type = type;
		this.money = money;
		this.state = state;
	}

}
