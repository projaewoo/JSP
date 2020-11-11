<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.ArrayList, com.example.libs.model.StudentVO" %>    

<%-- <%
	String path = application.getRealPath("/WEB-INF/oracle.properties");
%> --%>
	<%-- useBean : SelectService -> StudentVO의 기본 생성자 호출.--%>
<jsp:useBean id = "service" class = "com.example.libs.service.SelectService" />
<%-- <jsp:setProperty name = "service" property = "path" value = "<%= path %>" /> --%>
<%-- name과 id가 service로 같은 com.example.libs.service.SelectService에 setPath(path).--%>
<%
	ArrayList<StudentVO> list = service.selectAll();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to 쌍용고등학교</title>

<%-- bootstrap 사용하기 위한 import. --%>
<link rel = "stylesheet"  href = "css/bootstrap.css" />

</head>
<body>

	<h1 class = "text-center">쌍용 고등학교 성적관리 프로그램</h1>
	<div class = "container">
	<div class = "row">		<!--  container 안에 row 안에 table  // 반응형 웹의 가운데 정렬 위해서 -->
		<table  class = "table"  style = "border : 0px">
				<tr>
					<td>[<a href = "input.html">입력하기</a>]</td>
					<td class = "text-right">(<%= (list == null) ? "0" : list.size() %>)명</td>
				</tr>
		</table>
	</div>
	</div>
	
	<div class = "container">
	<div class = "row">		<!--  container 안에 row 안에 table  // 반응형 웹의 가운데 정렬 위해서 -->
		<table  class="table table-bordered">
			<thead>
				<tr class = "info">
					<th>등수</th><th>학번</th><th>이름</th>
					<th>국어</th><th>영어</th><th>수학</th>				
				</tr>
			</thead>
			<tbody>
				<% if(list == null) { %>  <%-- 학생이 없다면. --%>	
					<tr>
						<td colspan = "6"  class = "text-center">No Data!</td>
					</tr>
				<% }else {		//학생이 있다면 
							for(int i = 0 ; i < list.size(); i++) {
								StudentVO student = list.get(i);
								String hakbun = student.getHakbun();
				%>		
						<tr>
							<td><%= i+1 %></td>
							<td><a href = "view.jsp?hakbun=<%=hakbun%>"><%= hakbun %></a></td>	<!--  view.jsp로 갈때, 파라미터로 학번 넘김. -->		
							<td><%= student.getName() %></td><td><%= student.getKor() %></td>
							<td><%= student.getEng() %></td><td><%= student.getMat() %></td>
						</tr>	
				
						
				<%		} //for end 
					}  //else end
				 %>
			</tbody>
		</table>
	</div>
	</div>
	
</body>
</html>