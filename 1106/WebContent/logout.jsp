<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.HashMap" %>

<%
	//로그인 했는지 확인
	HashMap<String, Object> map = 
			(HashMap<String, Object>)session.getAttribute("mysession");		//강제 형변환.
			
	if(map == null) {		//login을 한 적 없이 localhost/1106/logout.jsp로 들어온 상황.
%>
		<script>
			alert("먼저 로그인부터 하셔야 합니다!");
			location.replace("login.html");			//login.html로 이동.
		</script>		
<% 
	}else {		//login을 해서 welcome1.jsp -> logout.jsp로 온 상황.
		String username = (String)map.get("USERNAME");
%>

<div><%= username %>님! 다음에 또 만나요. 제발~</div>
<div>앙뇽!</div>

<%
		response.setHeader("Cahe-Control", "no-cache");		//브라우저의 Cache 삭제
		response.setHeader("Cahe-Control", "no-store");
		response.setDateHeader("Expires", 0L);			//만료기간
		session.invalidate();		//session 모두 초기화.
	} 
%>