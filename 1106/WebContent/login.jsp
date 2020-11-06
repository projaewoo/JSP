<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id = "login"  class = "com.example.libs.LoginBean"   scope = "page" />		<!--  page : session처리 X -->

<%
	//login.html이 POST방식이므로 한글 깨짐
	request.setCharacterEncoding("utf-8");	//한글 깨짐 방지
	

	Cookie cookieFlag = null;
	Cookie cookieName = null;
	
	String userid = request.getParameter("userid");
	String password = request.getParameter("userpwd");
	if(userid.equals(login.getUserid()) && 
				password.equals(login.getUserpwd())) {		//login 성공하면
		cookieFlag = new Cookie("flag", "true");		//쿠키의 key, value : String
		cookieName = new Cookie("username", request.getParameter("username"));
		//쿠키 내보내기.	//유저의 브라우저에 저장됨.
		response.addCookie(cookieFlag);
		response.addCookie(cookieName);
		response.sendRedirect("welcome.jsp");			//welcom.jsp로 이동.		//redirect : HTML본문 내용과 URL이 동일.
	}else {		//ID, Password 일치하지 않으면
%>
	<script>
		alert("아이디 혹은 비밀번호가 일치하지 않습니다 ㅠ.ㅠ");
		history.back();		//뒤로 감.
	</script>
<% } %>