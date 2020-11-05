<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--상단에 header.html 출력 --%>
<jsp:include page = "header.html" flush = "true"/>

<%--중간에 date.jsp 출력 --%>
<jsp:include page = "date.jsp" flush = "false">
	<jsp:param name = "year"   value = "2020" />
	<jsp:param name = "month"   value = "11" />
	<jsp:param name = "day"   value = "5" />
</jsp:include>

<%--하단에 copyright.html 출력 --%>
<jsp:include page = "copyright.html" />   