<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib  prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id = "cnt"  class = "com.example.libs.CountBean"  scope = "application"/>	
<%-- 기본생성자 호출. // application : 이 bean은 모든 유저에게 적용 ... 크롬, 익스플로러, firefox에서 공유 가능. --%>

<c:set  var = "mycount"  property = "count"  target = "${cnt }"  />

방문자 수 : <c:out  value = "${cnt.count }" />   <%--   = cnt.getCount()  --%>