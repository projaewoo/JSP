<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix = "sql"  uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib  prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>
	<%-- 출력, 반복을 위해서 core태그 필요. --%>
    
<%-- DB연동 --%>
<%-- 방법 1 : JNDI 사용 안할 경우, driver, url, user, password 지정 --%>
<%-- <sql:setDataSource driver = "oracle.jdbc.driver.OracleDriver" 
							url = "jdbc:oracle:thin:@www.example.com:1521:XE"
							user = "scott"
							password = "tiger"  	/> --%>	
<%-- 방법 2 : 직접 JNDI 데이터 소스 사용할 때, dataSource로만 끌어다 쓸 수 있음. --%>    
<sql:setDataSource  dataSource = "jdbc/myoracle"  var = "conn"  />		<%-- dataSource를 conn에 저장. --%> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- DataSource 출력 --%>
	<%-- <c:out  value = "${ conn }" /> --%>
	
	<%-- 쿼리문의 결과를 rs에 저장. --%>
	<sql:query  var = "rs"  dataSource= "${conn }" >
		SELECT * FROM emp
	</sql:query>	
	
	<%-- 쿼리문 결과를 출력 --%>
	<c:out  value = "${rs }" />

</body>
</html>