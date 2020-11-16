<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "com.example.libs.UserInfo" %>

<%-- bean생성 --%>
<jsp:useBean id="user"  class= "com.example.libs.UserInfo" />		<%-- 굳이 지정안해주면 scope : page--%>

<%-- bean 세팅 --%>
<jsp:setProperty property = "name"  name = "user"  value = "정재우"/>
		<%-- user라는 bean의 name에 "정재우"라고 세팅 --%>
<jsp:setProperty property = "age"  name = "user"  value = "29"/>
<jsp:setProperty property = "gender"  name = "user"  value = "male"/>
<jsp:setProperty property = "address"  name = "user"  value = "경기도 이천시"/>

<%
	pageContext.setAttribute("USERINFO", user);		//USERINFO에 user를 통째로 넣음.		//pageContext : 다른 페이지로 가면 USERINFO 삭제됨.
	
	Object obj = pageContext.getAttribute("USERINFO");		//나올 때, Object 
	UserInfo jaewoo = (UserInfo)obj;					//강제 형변환.
%>

<ul>
	<li>이름 : <%= jaewoo.getName() %></li>		
	<li>나이 : <jsp:getProperty property="age" name="user"/>	</li>		<!--  user의 age가져옴 -->
	<li>성별 : ${user.gender } = ${user['gender'] }</li>		<!--   = jsp코드의 user.getGender() ... user의 gender가져옴 -->
	<li>주소 : ${user['address'] }</li>		<!--    = jsp코드의 user.getAddress() -->
</ul>