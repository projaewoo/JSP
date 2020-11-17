<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- JSTL의 out출력 --%>
    
<%@ taglib prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>    

<h1>Request Package Header Information</h1>
<%
	String userAgent = request.getHeader("user-agent");
	//java로 출력
	//out.println(userAgent);
	
	pageContext.setAttribute("USERAGENT", userAgent);
%>
<%--EL로 출력 --%>
<%-- ${pageScope['USERAGENT']} --%>

<%-- JSTL로 출력 --%>
<%-- <c:out value="${pageScope['USERAGENT'] }"></c:out> --%>


<%--  escapeXml : value 안의 태그 렌더링할지 결정 --%>
<%-- <c:out value="<font color='red'>빨간 글씨</font>는 다음과 같이 출력합니다"  escapeXml = "true" /><br /><br />
<c:out value="<font color='red'>빨간 글씨</font>는 다음과 같이 출력합니다" escapeXml = "false" /> --%>

<%
	//문자열 자체에 태그 있을 경우, 태그 적용해서 출력
	String str = "<span style = 'color : blue; background-color : yellow;  font-size : 3em'>" +
					"Hello, World</span>";
	pageContext.setAttribute("MYTAG", str);		
%>
<%-- ${pageScope.MYTAG} --%>

<%-- EL은 문자열 안의 태그 무조건 적용해서 출력 --%>
<%-- JSTL의 out : 문자열 안의 태그 적용 안 할 수 있음. --%>
<%-- <c:out value="${pageScope.MYTAG }"  escapeXml = "true"></c:out> --%>

<%-- username에 값이 없을 경우, Hello World 출력 --%>
<c:out value="${param.username}"  default = "Hello, World" />