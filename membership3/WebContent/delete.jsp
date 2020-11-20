<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="delete" class="com.example.libs.service.DeleteService" />
<c:set var="row" value="${delete.deleteMember(userid)}" />
<c:if test="${row ne 1}">
	<script>
		alert("회원 탈퇴 실패");
		history.back();
	</script>
</c:if>
<c:if test="${row eq 1}">
	<c:remove var="userid" scope="session" />
	<c:redirect url="index.html" />
</c:if>
