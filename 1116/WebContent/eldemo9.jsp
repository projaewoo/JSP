<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.Date" %>

<%-- body부분의 eldemo 그리려면(렌더링하려면) taglib를 참조 --%>
<%@ taglib prefix = "eldemo"  uri = "/WEB-INF/tlds/el-functions.tld" %>		<%-- 만일 태그 접두사가 eldemo로 시작하면 uri를 참조. --%>

<%-- 세팅 --%>
<%
	pageContext.setAttribute("TODAY", new Date());			//key : TODAY , value : new Date()
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Now is ${eldemo:mymethod(TODAY) } 입니다.</h3> 		<!--  접두사 : eldemo,  메소드 : mymethod -->
</body>						<!-- jsp가  mymethod호출하면  tld가 변환해서 mymethod에 해당하는 메소드가 있는 클래스(ElDemo.java)로 가서, ElDemo.java에서 메소드 호출.-->
</html>