<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Cookie [] array = request.getCookies();		//모든 쿠키 다 가져와.
	boolean flag = false;
	String username = null;
	if(array != null) {
		for(int i = 0 ; i < array.length; i++) {
			Cookie c = array[i];
			if(c.getName().equals("flag")) {			//수많은 쿠키 중 flag이름의 쿠키와 같다면
				flag = Boolean.parseBoolean(c.getValue()); 
			}
			if(c.getName().equals("username")) {
				username = c.getValue();
			}
		}
	}
	if(!flag) {		//login을 한 적이 없다면.	//(!false) = (true)
%>
		<script>
			alert("먼저 로그인부터 하셔야 합니다!");
			location.replace("login.html");			//login.html로 이동.
		</script>		
<% } %>

<div><%= username %>님! 환영합니다.</div>
<div>즐거운 하루 되세요!</div>

<%--
	Cookie를 이용한 Logout처리는 flag cookie를 지우면 됨.
--%>