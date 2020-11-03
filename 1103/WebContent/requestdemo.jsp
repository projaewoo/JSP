<%--

	request객체 하는 일
	
	1. client에 관련된 정보 읽기
	2. server와 관련된 정보 읽기
	3. client가 전송한 parameter 읽기
	4. client가 전송한 header 정보 읽기
	5. client의 cookie 정보 읽기
		(쿠키 : 유저의 HDD정보)
	6. 속성에 관한 정보 관리
		(세션에 정보 저장) (세션 : 한 유저가 같은 브라우저의 여러 페이지 다닐 때, 저장하는 정보) 
	
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>request 내장 객체 연습</title>
<ul>
	<li>요청 메소드 : <%=request.getMethod() %></li>
	<li>요청 uri : <%=request.getRequestURI() %></li>
	<li>요청 url : <%=request.getRequestURL() %></li>
	<li>요청 serverName : <%=request.getServerName() %></li>
	<li>요청 serverPort : <%=request.getServerPort() %></li>
	<li>요청 contextPath : <%=request.getContextPath() %></li>
	<li>Client IP : <%=request.getRemoteAddr() %></li>
	<li>Client Machine : <%=request.getRemoteHost() %></li>
	<li>Client User : <%=request.getRemoteUser() %></li>
	<li>Client Port : <%=request.getRemotePort() %></li>
	
</ul>