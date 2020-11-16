<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- EL 사용 안하는 jsp 코드 --%>
<%--  
<%@ page import = "java.util.Enumeration" %>
<%
	Enumeration<String> list = request.getHeaderNames();
%>    
<ul>
	<%
		while(list.hasMoreElements()){
			String name = list.nextElement();
			out.println("<li>" + name + " : " + request.getHeader(name) + "</li>");
		}
	%>
</ul>
 --%>


<%-- EL 사용하는 코드 --%>
<ul>
	<li>Host : ${header['host'] }</li>		<!-- header :  단수인 경우 -->
	<li>User-Agent : ${header['user-agent'] }</li>
	<li>Accept : ${headerValues.accept[0]}, ${headerValues.accept[1] }</li>		<!-- headerValues : 값이 복수인 경우 -->
	<li>Accept-Language : ${headerValues['accept-language'][0] }</li>
</ul>