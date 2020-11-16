<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- jsp코드 --%>
<%
	session.setAttribute("num1", new Integer(5));
	session.setAttribute("num2", 9);			// 9 = new Integer(9)	 <= Auto Boxing
%>


<%-- EL : set...() 불가능! --%>    
<%-- num1 : <%= (Integer)session.getAttribute("num1") %><br/> --%>		<!-- jsp코드 : 자동 형변환 안됨! -->
num1 : ${sessionScope.num1} <br/>
num2 : ${sessionScope.num2}<br/>		<!-- EL :  자동 형변환 -->

<h1>\${sessionScope.num1} 와 \${sessionScope.num2} 연산</h1>		<!--  \ : 뒤에 나오는 특수문자를 그대로 출력. -->
${sessionScope.num1 + sessionScope.num2}<br/>
${sessionScope.num1 - sessionScope.num2}<br/>
${sessionScope.num1 * sessionScope.num2}<br/>
${sessionScope.num1 div sessionScope.num2}<br/>		<!-- EL의 나눗셈 표현 -->
${sessionScope.num1 mod sessionScope.num2}<br/>		<!-- EL의 나머지 표현 -->
${sessionScope.num1 eq sessionScope.num2}<br/>			<!-- EL의 같은지 표현 -->
${sessionScope.num1 ne sessionScope.num2}<br/>			<!-- EL의 ... 표현 -->
${sessionScope.num1 lt sessionScope.num2}<br/>			<!-- EL의 앞이 작은지 표현-->