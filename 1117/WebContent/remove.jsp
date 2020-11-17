<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%--  remove  --%>

<%@ taglib  prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>

<c:set  var = "userAgent"  value = "${header['user-agent'] }" />		<%-- 변수 명 : userAgent, --%>
설정값 : <c:out  value = "${userAgent}" /> <br/>

<%-- userAgent 제거 --%>
<c:remove   var="userAgent"/>
		
제거값 :  <c:out  value = "${userAgent}" /> <br/>