<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.HashMap" %>
<%-- HashMap 사용하기 위해 import --%>

<%
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("NAME", new String("정재우"));
	map.put("AGE", new Integer(24));
	map.put("ADDRESS", "서울시 강남구 역삼동 한독빌딩 8층");

	//map을 session에 넣기
	session.setAttribute("mysession", map);		//mysession에 map넣기.
	//response.sendRedirect("sessionget.jsp");				//sessionget.jsp로 돌아가기	//redirect  : 유저가 다시 sessionget.jsp 요청
%>

<div>방금 session가 저장됐습니다.</div>
<a href = <%= response.encodeUrl("sessionget.jsp")%> >Session Get</a>