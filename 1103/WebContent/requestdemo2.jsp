<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>
<%-- Enumeration 사용하기 위해 import --%>
<H1>User's Header Information</H1>
<ul>
	<%
		//Enumeration : 나열형 변수들을 저장하기 좋음.
		Enumeration<String> names = request.getHeaderNames();			//header의 이름들을 names에 저장.	//웹 브라우저마다 header의 이름 다름.
		while(names.hasMoreElements()) {
			String name = names.nextElement();
			String value = request.getHeader(name);		//name을 넣으면 value가 나옴.
	%>
		<li><%= name + " : " + value%></li>			
	<% } %>
</ul>
