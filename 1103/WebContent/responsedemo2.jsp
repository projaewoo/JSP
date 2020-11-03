<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 첫 번째 방법 (1-1) --%>
<%-- 멤버변수 생성 --%>
<%!
	int count = 0;
%>
<%-- 멤버변수로 선언했으므로 웹브라우저 닫았다가 다시 열어도 count 갯수 그대로. --%>

<%-- 두번째 방법 --%>
<%
	response.setHeader("Refresh", "1");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 첫 번째 방법 (1-2) --%>		<%-- 1초마다 웹브라우저 refresh --%>
<!-- <meta http-equiv="Refresh"   content = "1">  -->
<title>Insert title here</title>
</head>
<body>
	방문자 수 : <%= ++count %>
</body>
</html>