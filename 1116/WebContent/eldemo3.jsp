<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- cookie 사용 --%>
<%-- EL은 출력용이므로, jsp코드로 cookie 생성 --%>
<%
	Cookie c1 = new Cookie("username", "정재우");		
	Cookie c2 = new Cookie("userage", "29");			//cookie : 무조건 string
	Cookie c3 = new Cookie("usergender", "남성");
	//내보내기 	//쿠키 세팅.
	response.addCookie(c1);
	response.addCookie(c2);
	response.addCookie(c3);
	//cookieget.jsp로 이동
	response.sendRedirect("cookieget.jsp");
%>