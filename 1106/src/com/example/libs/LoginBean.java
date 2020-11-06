package com.example.libs;

public class LoginBean {
	private String userid;
	private String userpwd;
	
	public LoginBean() {
		this.userid = "jaewoo";
		this.userpwd = "12345";
	}

	public String getUserid() {
		return userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

}