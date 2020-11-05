<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%--error 처리 // error.jsp에서 에러 페이지 보여줌. //false : 나는 에러페이지 아님 = exception객체 사용 불가.--%>
<%-- <%@ page errorPage = "error.jsp" isErrorPage = "false"%> --%>
    
<%
	int first = Integer.parseInt(request.getParameter("first"));
	int second = Integer.parseInt(request.getParameter("second"));
%>
<%= first %> / <%= second %> = <%= first / second%>
