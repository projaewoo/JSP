<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.HashMap" %>

<%
	//로그인 했는지 확인
	HashMap<String, Object> map = 
			(HashMap<String, Object>)session.getAttribute("mysession");		//강제 형변환.
			
	if(map == null) {		//login을 한 적이 없이 localhost/1106/welcome1.jsp로 들어온 상황이라면
%>
		<script>
			alert("먼저 로그인부터 하셔야 합니다!");
			location.replace("login.html");			//login.html로 이동.
		</script>		
<% 
	}else {		//login을 해서 redirect로 넘어왔다면
		String username = (String)map.get("USERNAME");
%>

<div><%= username %>님! 환영합니다.</div>
<div>즐거운 하루 되세요!</div>
<div><a href = "logout.jsp">Logout</a></div>

<% } %>