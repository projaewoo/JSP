<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page session = "false" %> --%>    <%-- session 사용 x : menu.html, cart.jsp, remove.jsp 간의 변수 공유 X. --%>
    
<%@ page import  = "java.util.Vector" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page = "menu.html" />
<%
	request.setCharacterEncoding("utf-8");
	String item = request.getParameter("item");		//나훈아, 태진아 
	String step = request.getParameter("step");		//add or remove
	Vector<String> cart = null;
	if(item != null) {
		cart = (Vector<String>)application.getAttribute("mycart");	//강제 형변환. (Object -> Vector<String>)
		
		if(cart == null) {		//처음 방문해서 카트를 만든 적이 없다면
			cart = new Vector<String>(1,1);		//초기 사이즈. //(1,1)씩 증가.
			cart.addElement(item);		//나훈아, 태진아
			application.setAttribute("mycart", cart);		//데이터 타입 : (String, Object)
		}else {		//이미 전에 세션이 있었다면
			if(step.equals("add")) {		//담기용 카트라면
				cart.addElement(item);
			}else {								//remove용 카트라면
				cart.removeElement(item);
			}
		}
	
%>
	<h2>현재 카트에 <%= cart.size() %>개의 상품이 담겨있습니다.</h2>
	<hr />
	<ol>
	<% for(int i = 0 ; i < cart.size(); i++) { %>
		<li><%= cart.get(i) %></li>		
	<% } %>		<%-- for 끝. --%>
	</ol><br /><br />
	<% if(cart.size() > 0) { %>
			<jsp:include page = "remove.jsp" />
	<% } %>		<%-- if 끝. --%>
<% } %>			<%-- if 끝. --%>
</body>
</html>