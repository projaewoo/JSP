<%--
	pageContext 역할
	1. 기본 객체 구하기
	2. 속성 다루기
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!			//_jspService() 밖의 지역.		//9개의 내장 객체 사용 불가.
	public void printDemo(PageContext pc) throws java.io.IOException{
		JspWriter out = pc.getOut();
		ServletRequest parentRequest = pc.getRequest();
		HttpServletRequest req = (HttpServletRequest)parentRequest;		//강제적 형변환  (부모를 자식으로 강제 형 변환)
		out.println("Hello, World<br/>");
		out.println("user address : " + req.getRemoteAddr());
}
%>

<%		//여기는 _jspService() 지역.		//9개의 내장 객체 사용 가능.
	printDemo(pageContext);
%>