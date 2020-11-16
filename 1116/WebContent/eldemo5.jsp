<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- pageContext --%>

<%-- jsp코드 --%>
User Address : <%= pageContext.getRequest().getRemoteAddr() %><br/>
Request URI : <%= request.getRequestURI() %><br/>			<!--  = pageContext.getRequest.getRequestURI() -->
<br>

<%-- EL : request객체 없음 ... request객체 읽어와야함--%>
User Address : ${pageContext.request.remoteAddr}<br/>		<!--  = pageContext.getRequest().getRemoteAddr() -->
Request URI : ${pageContext.request.requestURI }<br/>		<!--  = pageContext.getRequest().getRequestURI() -->