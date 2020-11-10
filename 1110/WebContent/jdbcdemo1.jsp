<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %> 

<%-- DBConnection, DBClose 클래스 사용하기 위한 import --%>
<%@ page import = "com.example.libs.model.*" %>


<%
	String path = application.getRealPath("/WEB-INF/oracle.properties");
	DBConnection dbconn = new DBConnection(path);		//진짜 물리적 경로로 DBConnection 생성
	Connection conn = dbconn.getConnection();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= conn %>
</body>
</html>

<%
	DBClose.close(conn);
%>