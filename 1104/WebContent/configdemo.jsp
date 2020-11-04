<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.RandomAccessFile, java.io.File" %>
    
<%
	String path = config.getInitParameter("mariadb.properties");		//servelt 안에 jsp-file의 init-param가져오기.
	String url = application.getInitParameter("db.url");				//context-param가져오기.
%>
<ul>
	<li>MaridDB properties : <%= path %></li>
	<li>MySQL url : <%= url %></li>
</ul>

<hr/>

<%
	File file = new File(path);
	RandomAccessFile raf = new RandomAccessFile(file, "r");		//읽기 모드
	String line = null;
	while((line = raf.readLine()) != null) {
		out.println(line + "<br/>");
	}
	raf.close();
%>