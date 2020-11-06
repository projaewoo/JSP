<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- Cookie 삭제. --%>    

<%
	Cookie cookie = new Cookie("ADDRESS", "");
	cookie.setMaxAge(-1);		//만료일자를 -1로.
	response.addCookie(cookie);		//다시 쿠키 방출 -> ADDRESS 쿠키 삭제.
	response.sendRedirect("cookieget.jsp");				//cookieget.jsp로 돌아가기	//redirect  : 유저가 다시 cookieget.jsp 요청
%>

<div>ADDRESS의 Cookie가 삭제됐습니다 ㅜㅠㅠ</div>