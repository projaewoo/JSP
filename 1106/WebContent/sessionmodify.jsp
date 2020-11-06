<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.HashMap" %>
<%-- HashMap 사용하기 위해 import --%>

<% 
	//세션 꺼내서 강제 형변환 해서 map에 넣기.
	HashMap<String, Object> map = 
			(HashMap<String, Object>)session.getAttribute("mysession");
	if(map == null){		//session이 안만들어졌다면
		response.sendRedirect("sessionset.jsp");		//sessionset.jsp로 돌아가기.	//redirect  : 유저가 다시 sessionset.jsp 요청
	}else {
		//map에서 ADDRESS가져와서 address에 넣기.
		String address = (String)map.get("ADDRESS");	//map의 반환형 : Object이므로 
		address = "이천시 증포동";
		//ADDRESS에 바뀐 address 넣기.
		map.put("ADDRESS", address);		
		
		response.sendRedirect("sessionget.jsp");
%>
<div>방금 session가 수정됐습니다!</div>
<% } %>