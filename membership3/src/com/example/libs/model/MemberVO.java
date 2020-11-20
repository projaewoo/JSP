package com.example.libs.model;

public class MemberVO {
	private String userid;
	private String passwd;
	private String name;
	private String email;
	private String gender;
	private String city;
	private int age;
	private int flag;		//유저 or 관리자 판단하는 변수
	
	public MemberVO() {
		this.city = "";
	}   //for Java Bean

	//필수 입력사항만 세팅하는 생성자.
	public MemberVO(String userid, String passwd, String name, String email, String gender) {
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.gender = gender;
	}
	
	//모든 변수를 세팅하는 생성자.
	public MemberVO(String userid, String passwd, String name, 
									String email, String gender, String city, int age,int flag) {
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.city = city;
		this.age = age;
		this.flag = flag;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}
	
	
	
}
