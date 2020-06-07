package com.myuni.wyglsys.entity;

public class UserLogin {
	private int id;
	private String account;
	private String pwd;
	private String phone;
	private String email;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "UserLogin [id=" + id + ", account=" + account + ", pwd=" + pwd + ", phone=" + phone + ", email=" + email
				+ "]";
	}
	public UserLogin(int id, String account, String pwd, String phone, String email) {
		super();
		this.id = id;
		this.account = account;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
	}
	public UserLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

}
