<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Cookie cookie = null; 
	Cookie [] array = request.getCookies();			//쿠키 배열이 들어옴(request)	//cookiedemo.jsp에서 cookiedemo1.jsp로 쿠키 배열이 들어옴.
	for(int i = 0 ; i < array.length; i++) {
		Cookie c = array[i];
		if(c.getName().equals("username")) {		//i번째 쿠키의 이름이 "username"이라면
			cookie = c;
		}
	}
%>    

<body>
	<ul>			<!--  쿠키 정보 가져오기 -->
		<li>Cookie Name : <%= cookie.getName() %></li>
		<li>Cookie Value : <%= cookie.getValue() %></li>
		<li>Cookie expire Date : <%=cookie.getMaxAge() %></li>		<!--  cookie의 만료시점. -->
	</ul>
</body>