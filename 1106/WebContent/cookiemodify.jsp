<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- Cookie 수정하기 --%>    

<% 
	response.addCookie(new Cookie("AGE", "44"));	
response.sendRedirect("cookieget.jsp");				//cookieget.jsp로 돌아가기	//redirect  : 유저가 다시 cookieget.jsp 요청
%>
<%-- cookieset.jsp의 쿠키에 덮어쓰기.--%>

<div>방금 Cookie가 수정됐습니다!</div>