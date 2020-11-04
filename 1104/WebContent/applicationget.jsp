<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String username = (String)application.getAttribute("username");		//리턴타입 : object  
	String userage = (String)application.getAttribute("userage");
%>
<h1>application 변수 확인하기.</h1>
<ul>
	<li>이름 : <%= username %></li>
	<li>나이 : <%= userage %></li>
</ul>