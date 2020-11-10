<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 앞 페이지에서 넘기는 값 받기 --%>
<%
	request.setCharacterEncoding("utf-8");		//들어오는 모든 request : utf-8로 인코딩.
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>약관</h3>
	<form action = "subscribe.jsp" method = "POST">
<!-- 	form 안에 있어야 서버로 전송됨
		내부로 서버에 보내기 위해 hidden 이용.
			hidden 사용안하면 33행의 value yes or no만 서버로 넘어감.
-->
	<input type = "hidden"  name = "id"  value = "<%=id %> "/>
	<input type = "hidden"  name = "password"  value = "<%=password %> "/>
	<input type = "hidden"  name = "name"  value = "<%=name %> "/>
		------------------------------------------------------<br/>
		1. 회원 정보는 웹 사이트의 운영을 위해서만 사용됩니다. <br>
		2. 웹 사이트의 정상 운영을 방해하는 회원은 탈퇴 처리합니다. <br>
		------------------------------------------------------<br/>
		위의 약관에 동의하십니까?
		<input type = "radio" name = "agreement" value = "yes">예&nbsp;&nbsp;
		<input type = "radio" name = "agreement" value = "no">아니오<br/>
		<button>계속</button>
	</form>
</body>
</html>
