<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>

<%-- log 기록 남기기. --%>

<%
	String str = String.format("방문날짜시간 : %tT\t", new Date());		//%tT : 시, 분, 초를 한꺼번에 찍음.		//  \t : tab
	application.log(str);		//str 기록해.
	str = request.getRequestURI();
	application.log(str + "\t");			//str 기록.
	application.log("한글이 잘 되나요?\n");
	
%>   