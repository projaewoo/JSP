<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 쿠키 설정 --%>
<%
	response.addCookie(new Cookie("NAME", "정재우"));
	response.addCookie(new Cookie("AGE", "29"));
	response.addCookie(new Cookie("ADDRESS", "경기도.광교"));
	response.sendRedirect("cookieget.jsp");				//cookieget.jsp로 돌아가기	//redirect  : 유저가 다시 cookieget.jsp 요청
%>

<div>방금 Cookie가 저장됐습니다.</div>