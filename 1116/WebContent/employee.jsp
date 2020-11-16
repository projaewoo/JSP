<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "eldemo"  uri = "/WEB-INF/tlds/el-functions.tld" %>  

<%-- ename으로 넘어오는 값을 ENAME으로 받음. --%> 
<%
	pageContext.setAttribute("ENAME", 
						request.getParameter("ename"));
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H1>${param.ename}'s Info</H1>
	<%-- ${empty ( eldemo:empinfo(ENAME) ) ? "Not Found" : eldemo:empinfo(ENAME)} --%>		<!-- eldemo:empinfo(ENAME)가 empty이면 Not Found -->
	${eldemo:empinfo(param.ename) }
</body>
</html>