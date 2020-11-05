<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 한글 깨짐 방지 --%>
<% request.setCharacterEncoding("utf-8"); %>

    
<%-- 앞에서 넘어온 값을 받음 --%>
<jsp:useBean id = "col"  class = "com.example.libs.ColorBean"  scope = "request"/>

<%-- <jsp:setProperty name="col"  property="username"  param = "username" /> --%>
			<%-- param : username = HTML에서 input의 name : username --%>
<jsp:setProperty name = "col"  property = "*" />
		<%-- 6행과 동일 --%>	<%-- 태그의 name이 bean의 property와 일치할 경우, * 사용 가능 username이 username에게 들어감. --%>			
<jsp:forward page = "colorbean1.jsp" />
	<%-- 세팅하자마자 colorbean1.jsp에게 넘김 --%>