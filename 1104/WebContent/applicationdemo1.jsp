<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- DB연동을 위한 import --%>    
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.CallableStatement" %>
<%@ page import ="java.sql.ResultSet" %> 	 <%-- 1step. --%>

<%
	int deptno = 0;
	String deptnoStr = request.getParameter("deptno");
	if(deptnoStr != null) {    //첫 방문 페이지일 경우, null	//두 번째 이상 방문한 페이지일 경우, null이 아님.
		deptno = Integer.parseInt(deptnoStr);
	}else {		//첫 방문 페이지일 경우.
		deptnoStr = "";
	}
	
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	if(!deptnoStr.equals("")) {		//두 번째 이상 방문한 페이지일 경우.
		Class.forName(application.getInitParameter("db.driver"));		//2step.	//com.mysql.jdbc.Driver  //connecter를
		conn = DriverManager.getConnection(
										application.getInitParameter("db.url"), 
										application.getInitParameter("db.user"),
										application.getInitParameter("db.password"));		//3step.
		String sql = "{  call sp_test(?)  } ";								
		cstmt =   conn.prepareCall(sql);		//4step.
		cstmt.setInt(1, deptno);			//첫번째 ?에 deptno을 넣음. (JDBC : index가 1부터 시작.)		//비로소 완전한 SQL문장.
		rs = cstmt.executeQuery();		//5step.		//SELECT이므로 executeQuery()사용.
		//다 뿌려주고 난 뒤, 가장 마지막 라인에서  close()함.
	}
%>
    
<%-- css파일 끌어다 쓰기.--%>
<link rel = "stylesheet" href = "css/style.css" />

<%-- javaScript파일 끌어다 쓰기. --%>
<script src = "js/application.js"></script>

<%-- form에 action 안쓰면 자기 자신을 호출. --%>
<form>
				<%--select의 name : 서버에게 이름으로 넘어감. --%>
				<%--option의 value : 서버에게 값으로 넘어감. --%>
	부서번호 : <select name = "deptno">
					<option>-- 선택 --</option>
					<option value = "10" 
						<% if(deptnoStr.equals("10")) { 
								out.println("selected"); 
								} %>
								>10번 부서</option>
					<option value = "20" 
						<% if(deptnoStr.equals("20")) { 
								out.println("selected"); 
								} %>
								>20번 부서</option>
					<option value = "30" 
						<% if(deptnoStr.equals("30")) { 
								out.println("selected"); 
								} %>
								>30번 부서</option>
				</select>
</form>

<hr/>

<table border = "1">
	<thead>
		<tr>
			<th>사원번호</th><th>사원이름</th>
			<th>직무</th><th>부서번호</th>
			<th>부서명</th><th>부서위치</th>
		</tr>
	</thead>
	<tbody>
		<% if(rs != null) { %>
			<% while(rs.next()) { %>
						<tr>
							<td><%= rs.getInt("empno") %></td>
							<td><%= rs.getString("ename") %></td>
							<td><%= rs.getString("job") %></td>
							<td><%= rs.getInt("deptno") %></td>
							<td><%= rs.getString("dname") %></td>
							<td><%= rs.getString("loc") %></td>
						</tr>
			<% } //while 끝. %>
		<% }else { //if 끝.  %>
			<tr><td colspan = "6">No Date</td></tr>
		<% }  //else if  끝. %>
	</tbody>
</table>

<%
	if(rs != null)	rs.close();			//7step.
	if(cstmt != null) cstmt.close();
	if(conn != null) conn.close();
%>