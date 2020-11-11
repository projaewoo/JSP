<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- service에게 student, path 넘김. service에게 row 받음.--%>

<% request.setCharacterEncoding("utf-8");  //한글 인코딩 위해서 %>
<jsp:useBean  id = "student"  class = "com.example.libs.model.StudentVO" />
<jsp:setProperty  property = "*"  name = "student" />		<%-- property = *  : 이름이 같은 변수끼리 세팅. name이 name으로, kor가 kor로 --%>

<%-- jsp이므로 service불러야함 --%>
<jsp:useBean id = "insert"  class = "com.example.libs.service.InsertService" />

<%-- <%
	String path = application.getRealPath("/WEB-INF/oracle.properties");
%> --%>

<%-- <jsp:setProperty  property = "path"  name = "insert"  value = "<%=path %>" /> --%>

<%
	int row = insert.insertStudent(student);
	if(row == 1) {		//insert 성공.
		response.sendRedirect("list.jsp");
	}else {
%>
		<script>
			alert("학생 입력 실패");
			history.back();
		</script>
<% } //if end %>