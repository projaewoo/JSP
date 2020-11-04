<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.Date, java.text.SimpleDateFormat"%>
<%-- html을 header 따로, copyright 따로 붙여서 생성. --%>

<%-- 여기는 header 부분. --%>
<% pageContext.include("header.html"); %>
<%-- include : buffer 필요.  buffer에서 조립해서 유저에게 발송.--%>

<h1>여기는 본문입니다.</h1>
<img src = "images/meat.jpg"/>
<%		
	String pattern = "지금은 GG yyyy년 MM월 dd일 EE aa hh시 mm분 ss초 입니다.";
	SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	String now = sdf.format(new Date());	
%>
	<%=now %>		<%--출력.--%>
	
<%		//footer 부분.
	pageContext.include("copyright.html");
%>