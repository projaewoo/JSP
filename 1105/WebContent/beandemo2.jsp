<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id = "login"  class = "com.example.libs.LoginBean"    scope = "session" />    
 <%-- 생성자 만들어짐. --%>  
<%-- scope : bean의 life cycle --%>
<%-- scope = page (default)  : 현재 페이지 아니면 property값 날라감. --%>
<%-- scope = session  : 한 유저가 한 브라우저로 여러 개의 페이지 다닐 때, 정보 기억    --%>
<%-- scope = application  :  한 유저가 다른 브라우저 사용해도, 정보 기억 --%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> Bean Getting Page</h1>
	<ul>
		<li>아이디 : <jsp:getProperty  name="login"   property="userid"/> </li>
							<%-- login.getUserid() --%>
		<li>패스워드 : <jsp:getProperty   name = "login"  property = "userpwd" /></li>
							<%-- login.getUserpwd() --%>
	</ul>
</body>
</html>