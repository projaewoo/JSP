<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String oracle = application.getInitParameter("oracle.properties");
	//경로 :  /WEB-INF/oracle.properties
	
	String path = application.getRealPath(oracle);
%>

<ul>
	<li>Parameter Name : <%= application.getInitParameter("oracle.properties") %></li>		<!--  jsp방법 -->
	<li>Parameter Value : ${initParam['oracle.properties'] }</li>			<!--  EL 방법 (Spring에서 사용하는 방법) -->
</ul>