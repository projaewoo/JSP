package com.example.libs;

public class UserInfo {

	//Property : bean의 멤버변수.
	private String name;
	private int age;
	private String gender;
	private String address;
	
	//bean에는 getter, setter 메소드 있어야함.
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	
}