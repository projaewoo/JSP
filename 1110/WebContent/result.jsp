<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//session 가져옴. (이전 페이지에서 세션에 저장한 값 꺼내오기)
	String id = (String)session.getAttribute("id");			//나올 때,  object이므로 string으로 강제 형변환.
	String name = (String)session.getAttribute("name");		//세션에 저장한 값 꺼내오기
	String result = request.getParameter("result");		//세션이 아닌 파라미터로 들어옴		//"result.jsp?result=" + result  로 들어옴.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>
		<% if(result.equals("yes")) { %>
				<%= name %>(<%=id%>)님! 회원가입 성공!
		<% }else { %>
				<%= name %>(<%= id%>)님! 회원가입 실패!
		<% } %>
	</h2>
</body>
</html>