<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.Date" %>    
    
<%-- JSTL의 set --%>    
    
<%@ taglib prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>    
    
<h1>Request Package Header Information</h1>
<%-- jsp코드 --%>
<%-- <%
	String userAgent = request.getHeader("user-agent");
	out.println(userAgent);	
%> --%>

<%-- set : value를 myvariable에 넣기. --%>
<%-- <c:set var = "myvariable"  value = "${header['user-agent'] }" />
<c:out value = "${myvariable }" /> --%>

<%-- 날짜 가져오기 --%>
<%-- <jsp:useBean  id = "today"  class = "java.util.Date" />	<!--  Date의 기본생성자 호출 -->
<c:set target = "${today}"    var = "today_year"  value = "${today.year + 1900}"/>		<!--  getYear() -->
금년은 <c:out value = "${today_year }"  /> --%>

<jsp:useBean id = "mybean"  class = "com.example.libs.ColorBean" />		<!--  ColorBean의 기본생성자 호출 -->
<jsp:setProperty name = "mybean"   property = "username"  value = "정재우" />
<c:set   target="${mybean}"  property = "color"  value = "yellow" />

<%-- 출력하는 3가지 방법 (EL, out태그 사용, jsp 태그 사용)--%>
Your Name : <c:out value = "${mycolor}" />
Your Name : <jsp:getProperty name = "mybean"  property = "username" /><br/>
Your Name : ${mybean.username} <br/>

Your Color : ${mybean.color }<br/>
Your Color : <jsp:getProperty name = "mybean"  property = "color" /> <br/>
Your Color : <c:out  value = "${mybean.color }" />