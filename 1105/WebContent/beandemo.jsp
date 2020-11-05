<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- useBean 사용 --%>    
<%-- 멤버형 m = new Member(); --%>
<%-- 기본 생성자 호출 --%>
<jsp:useBean id ="m"  class = "com.example.libs.Member" />
<%--<jsp:setProperty name="m"  property="name"  value = "한지민"  />
  m.setName("한지민")   // name이라는 변수에 "한지민" 넣음 --%>

<%-- useBean 안쓰고 오로지 JavaCoding만 하게 되면 (10~12행) --%>
<%
	//com.example.libs.Member m = new com.example.libs.Member();
	 m.setName("한지민");
	// m.setAge(24);
%>
<jsp:setProperty name = "m"  property = "age"  value ="24"  />
<%-- m.setProperty(24)	//Member.java에서 int age이므로 "24" --> 자동으로 숫자 24로 형 변환. --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>이름 : <%= m.getName() %>></li>	<!--  m.getProperty(name) -->
		<li>나이 : <jsp:getProperty name = "m"  property = "age" /></li>	<!--  m.getProperty(age) -->
	</ul>
</body>
</html>