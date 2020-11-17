<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <c:forEach>가 무엇인지 알 수 있게끔 tablig달아줌. --%>
<%-- WEB-INF/lib의 jar파일 찾아감 --%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--  JSTL의 for문 -->
	<c:forEach var = "i"  begin = "1"  end = "100"  step = "1">
		<%-- <c:out value= "${i}" /> --%>&nbsp;&nbsp;&nbsp;		<!--  c:out의 value속성이 API에서 Request-time : true 이므로 EL 사용가능 ... ${i} 사용 -->
		${i }
	</c:forEach>
	
	<!-- JSP코드 -->
	<%-- 
	<% for(int i = 1 ; i <= 100; i++) { %>
			<%= i %>&nbsp;&nbsp;&nbsp;
	<% } %> 
	--%>
			
</body>
</html>