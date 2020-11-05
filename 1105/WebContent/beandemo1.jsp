<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id = "login"  class = "com.example.libs.LoginBean" scope = "session" />
<%-- 생성자 만들어짐. --%>  
<%-- scope : bean의 life cycle --%>
<%-- scope = page (default)  : 현재 페이지 아니면 property값 날라감. --%>
<%-- scope = session  : 한 유저가 한 브라우저로 여러 개의 페이지 다닐 때, 정보 기억  //beandemo2.jsp로 이동해도 property 기억.  --%>
<%-- scope = application  :  한 유저가 다른 브라우저 사용해도, 정보 기억 --%>

<jsp:setProperty name="login"  property="userid"  value = "jimin"  />
<%-- login.setUserid("jimin") --%>

<jsp:setProperty name = "login"  property = "userpwd"  value = "1234" />
<%-- login.setUserpwd(1234) --%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Bean setting page</h1>
	<ul>
		<li>아이디 : <%= login.getUserid() %></li>
		<li>패스워드 : <%= login.getUserpwd() %></li>
		<li><a href = "beandemo2.jsp">beandemo2.jsp로 가기</a></li>
		<%-- beandemo1에서 입력한 값이 deandemo2에서도 유효할까? --%>
		<%-- 4행에서 scope = "page"이므로 다른 페이지로 넘어가면 property값 날라감. --%>
	</ul>
</body>
</html>