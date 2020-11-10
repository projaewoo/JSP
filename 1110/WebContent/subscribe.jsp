<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");		//들어오는 모든 request : utf-8로 변환.
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String result = request.getParameter("agreement");		//yes or no
	
	//ID 중복확인.
	String sessionid = (String)session.getAttribute("id");
	if(sessionid.equals(id)) {
%>
	<script>
		alert("이미 사용중인 아이디입니다.");
		history.go(-2);		//두 번 뒤로.
	</script>
<%		
	}
	//Create session
	session.setAttribute("id", id);		//(key, value)		//id, jaewoo
	session.setAttribute("name", name);			//name, 정재우
	
	response.sendRedirect("result.jsp?result=" + result);		//result.jsp로 redirect방식으로 넘김.		//redirect : URL과 본문내용 일치.
%>