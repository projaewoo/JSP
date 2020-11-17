<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- Java 코드 사용 시 --%>
<%-- <%@ page errorPage = ""   isErrorPage="true"%>		error페이지 지정.
<%= 10 / 0 %> --%>

<%-- JSTL 사용 --%>
<%@ taglib  prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>
<c:catch  var = "myerror" >		<%-- 에러메세지 : var에 저장 --%>
<%= 10 / 2 %> <br/>
</c:catch>

<%-- JSTL은 if만 있고, else는 없음. --%>
<c:if  test = "${empty myerror}">		<%-- 참 = myerror 없음. --%>
	<c:out value = "<scan style = 'color : red'>잘 처리됐습니다. </scan>" escapeXml = "false" />
	<%-- escapeXml = false ... 문자열 안의 태그 사용 --%>
</c:if>
<c:if  test = "${not empty myerror}">		<%-- 참 = myerror 있음. --%>
	ERROR 발생 : <c:out value = "${myerror }" />
</c:if>