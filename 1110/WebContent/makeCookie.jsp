<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--cookie 이름은 반드시 영문 	//한글일 경우, URLEncoder로 변환해야함!--%>    
<%@ page import = "java.net.URLEncoder" %>
    
<%
	//cookie 이름은 반드시 영문 	//한글일 경우, URLEncoder로 변환해야함!
	String cookie_name = request.getParameter("cookie_name");
	cookie_name = URLEncoder.encode(cookie_name, "utf-8");
	
	String cookie_value = request.getParameter("cookie_value");
	Cookie cookie = new Cookie(cookie_name, cookie_value);
							//new Cookie("초코칩", "3");
	//쿠키 발송.							
	response.addCookie(cookie);
	response.sendRedirect("displayCookie.jsp");
%>