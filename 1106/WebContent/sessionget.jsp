<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.HashMap" %>
<%-- HashMap 사용하기 위해 import --%>

<%
	String username = null;
	Integer userage = null;
	String useraddress = null;
	
	HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("mysession");	//강제 형 변환.
	
	//꺼내기
	if(map != null) {
		username = (String)map.get("NAME");	//return type : Object이므로 강제 형변환
		userage = (Integer)map.get("AGE");
		useraddress = (String)map.get("ADDRESS");
	}
%>
    

<h1>Session Get</h1>
<ul>
	<li>이름 : <%= (username == null) ? "" : username %></li>		<!-- session의 반환값 : Object이므로 String으로 강제 형변환. -->
	<li>나이 : <%= (userage == null) ? "" : String.valueOf(userage) %></li>
	<li>주소 : <%= (useraddress == null) ? "" : useraddress %></li>
</ul>
<div>
	<button onclick = "javascript:location.href = 'sessionset.jsp'; ">Session Set</button>		<!--  button 클릭하면 cookieset.jsp로 이동 -->
	<button onclick = "javascript:location.href = 'sessionmodify.jsp';">Session Modify</button>
	<button onclick = "javascript:location.href = 'sessiondelete.jsp';">Session Delete</button>
</div>
