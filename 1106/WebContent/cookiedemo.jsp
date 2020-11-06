<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.net.URLEncoder, java.net.URLDecoder" %>
 <%-- URL에서는 한글 지원 X, cookie에 한글 쓰기 위한 import--%>
<%@ page session = "false" %>
<%-- session 사용 X --%>
 
 <%
 	Cookie cookie = new Cookie("username",
 												URLEncoder.encode("정재우", "utf-8")); 	//java.lang은 기본적으로 import되어있으므로 따로 import 안해도 됨.
 	cookie.setMaxAge(60);				//cookie 만료시간 : 60초
 	response.addCookie(cookie);	//쿠키 발송.
 %>
<body>
	<ul>			<!--  쿠키 정보 가져오기 -->
		<li>Cookie Name : <%= cookie.getName() %></li>
		<li>Cookie Value : <%= URLEncoder.encode(cookie.getValue()) %></li>
		<li>Cookie expire Date : <%=cookie.getMaxAge() %></li>		<!--  cookie의 만료시점. -->
		<li><a href = "cookiedemo1.jsp">Cookie 읽기</a></li>
	</ul>
</body>