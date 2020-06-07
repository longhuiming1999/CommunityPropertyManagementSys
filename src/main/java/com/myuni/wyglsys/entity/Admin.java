package com.myuni.wyglsys.entity;

public class Admin {
	private String account;
	private String pwd;

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Admin [account=" + account + ", pwd=" + pwd + "]";
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Admin(String account, String pwd) {
		super();
		this.account = account;
		this.pwd = pwd;
	}
}
