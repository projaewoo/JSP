<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- EL을 사용하지 않았을 때의 코드 --%>
<%-- Name : <%= request.getParameter("name") %><br/>
Age : <%= request.getParameter("age") %> --%>


 <%-- EL(표현언어) 연습 --%>
 <%@ page isELIgnored="false" %>		<%-- false : EL 사용한다는 뜻 --%>
 Name : ${param.name} <br/>
 Age : ${param.age} <br/>				<%--EL : null이면 공백으로 찍음 --%>
 
 <%-- jsp코드는 자동 형변환 X --%>
 num1 : <%=request.getParameter("num1") %><br/>			<%-- param : 숫자가 아닌 string --%>
 num2 : <%=request.getParameter("num2") %><br/>
 num1 + num2 : <%= request.getParameter("num1") + request.getParameter("num2") %><br/>
 
 
 <%-- EL은 자동 형변환 됨 --%>
 num1 : ${param.num1}<br/>
 num2 : ${param.num2}<br/>
 num1 + num2 : ${param.num1 + param.num2} <br/>