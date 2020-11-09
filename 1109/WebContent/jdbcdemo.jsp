<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %> 

<%!
	private static String DBURL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
	private static String DBUSER = "scott";
	private static String DBPWD = "tiger";
%>
<%
	Class.forName(DBDRIVER);		//2step : driver loading
	Connection conn = DriverManager.getConnection(DBURL, DBUSER, DBPWD);	//3step
	Statement stmt = conn.createStatement();		//4step.
	String sql = "SELECT TO_CHAR(sysdate, 'yyyy-mm-dd') FROM dual";		//
	ResultSet rs = stmt.executeQuery(sql);		//5step
	
	rs.next();		//커서가 첫번째 줄 위를 가리키다가, 다음으로 내려옴. (현재 날짜 앞에 커서 위치).
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Now is <%= rs.getString(1) %>.
</body>
</html>
<%
	if(rs != null) rs.close();		//7step.
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();
%>