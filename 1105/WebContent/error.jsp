<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- true : 여기는 에러페이지. = exception객체 사용 가능 --%>    
<%@ page isErrorPage = "true" %>    
<%@ page import = "java.text.NumberFormat" %>

<%-- 방법 1 --%>
<%-- <%if(exception instanceof NumberFormatException) { %>	exception이 numberformat?
		<body style = "background-color : yellow">
			<div style = 'color : red'><%= "first와 second 변수의 값이 없습니다." %></div>
		</body>
<%}else if(exception instanceof ArithmeticException) {%>
		<body style = "background-color : lime">
			<div style = 'color : red'><%= "second의 값은 0이 될 수 없습니다." %></div>
		</body>
<%}else if(exception instanceof NullPointerException) {%>
		<body style = "background-color : orange">
			<div style = 'color : red'><%= "값이 null입니다." %></div>
		</body>
<%}else { %>
		<body style = "background-color : margenta">
			<div style = 'color : red'><%= "원인이 무엇인지 잘 모르겠습니다." %></div>
		</body>
<% } %>
 --%>
 
 
 <%-- 방법 2 --%>
 <%-- <body style = "background-color : red">
 	<img src = "images/autumn.jpg"> <br/>
 	Error Message : <%= exception.getMessage() %>
 </body> --%>
 
 
 <%-- 방법 3 --%>
 <%
 	String message = null;
 	if(exception instanceof NullPointerException) {
 		message = "값이 없습니다.";
 	}else if(exception instanceof NumberFormatException) {
 		message = "first와 second 변수의 값을 넣어주세요.";
 	}else if (exception instanceof ArithmeticException) {
 		message = "분모가 0이면 안됩니다.";
 	}else {
 		message = exception.getMessage();
 	}
 %>
 <body style = "background-color : yellow">
 	<div><%= message %></div>
 </body>