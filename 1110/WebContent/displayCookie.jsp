<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLDecoder" %>		<!-- 한글 변환. -->
    
 <%-- 쿠키 받아옴 --%>
 <%
 	Cookie [] array = request.getCookies();
 	if(array != null && array.length > 0) {
 		
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


&nbsp;&nbsp;&nbsp;&nbsp;쿠키 이름 : 쿠키 값<br/>
&nbsp;&nbsp;&nbsp;&nbsp;==========<br/>

	<% for(int i = 0 ; i < array.length ; i++) {
				Cookie cookie = array[i];	
				String cookie_name = cookie.getName();
				cookie_name = URLDecoder.decode(cookie_name, "utf-8");		//utf-8로 디코드
				if(!cookie_name.equals("JSESSIONID")) {
	%>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<%= cookie_name %> : <%= array[i].getValue() %> <br/>		<!--  그냥 array[i].getName() = 한글을 아스키코드로 출력. ... 27행처럼 디코드. -->			
	<%		
				}  //if end
			} 	//for end	
	%>			
	<a href ="inputCookie.html">쿠키 입력 화면으로 이동</a>
</body>
</html>

<% }else { %>
<body>
	<script>
		alert("Cookie가 전혀 없습니다.");
	</script>
	<a href ="inputCookie.html">쿠키 입력 화면으로 이동</a>
</body>
<% } %>