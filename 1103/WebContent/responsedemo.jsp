<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//캐쉬 날림.
	response.setHeader("Cache-Control", "no-cache");		//브라우저마다 no-cache가 먹거나, no-store가 먹음.
	response.setHeader("Cache-Control", "no-store");
	
	response.setDateHeader("Expires", -1L);			//expires : 만료 날짜 (1970년 기준)	//1969년까지만 유효 
%>
