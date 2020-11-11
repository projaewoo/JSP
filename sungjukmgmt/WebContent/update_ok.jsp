<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean  id = "student"  class = "com.example.libs.model.StudentVO" />
<jsp:setProperty  name = "student"  property = "*" />  <%-- 국어가 국어, 수학이 수학, 영어가 영어, 학번이 학번에 세팅 (이름이 같으므로)--%>
	
<jsp:useBean  id = "update"   class = "com.example.libs.service.UpdateService" />		<%-- UpdateService의 기본생성자 호출. --%>

<%-- <% String path = application.getRealPath("/WEB-INF/oracle.properties"); %> --%>
<%-- <jsp:setProperty  property = "path"  name = "update"  value = "<%=path %>" /> --%>

<%
	int row = update.updateStudent(student);		//수정한 row 갯수 반환.
	if(row == 1) {
		response.sendRedirect("view.jsp?hakbun=" + student.getHakbun());		//view.jsp로 	
	}else{	
%>
		<script>
			alert("학생 점수 수정 실패!");
			history.back();
		</script>
<% } %>