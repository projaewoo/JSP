package com.example.libs;

public class CountBean {

	private int count;

	//기본 생성자 : 멤버변수 초기화 : count = 0으로 초기화.
	
	public int getCount() {
		return ++count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}
