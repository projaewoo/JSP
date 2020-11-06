<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.invalidate();		//session 다 날림.
	response.sendRedirect("sessionget.jsp");				//sessionget.jsp로 돌아가기	//redirect  : 유저가 다시 sessionget.jsp 요청
%>

<div>ADDRESS의 session가 삭제됐습니다 ㅜㅠㅠ</div>