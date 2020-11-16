<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<ul>
	<li>${cookie.username.name } :  ${cookie['username'].value }</li>		<!-- 쿠키 객체의 name, value 가져옴. -->
	<li>나이 : ${cookie['userage'].value + 10 }세</li>		<!--  String => int로  자동 형변환되서 +10 계산. -->
	<li>성별 : ${cookie['usergender'].value }</li>
</ul>