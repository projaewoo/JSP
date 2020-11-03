<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>		<%--Enumeration 사용하기 위해 --%>
<%
	request.setCharacterEncoding("utf-8");
	Enumeration<String> names = request.getParameterNames();		
%>
<%-- input name, select name 등... name들만 찍음 --%>
<%-- 들어오는 값은 다 utf-8로 수정. --%>
<ul>
 	<% 
 		while(names.hasMoreElements()) {
 			String name = names.nextElement();
 			if(!name.equals("hobby")) {		//이름이 hooby가 아닐 경우
 				String value = request.getParameter(name);			//단수일 경우, getParameter() 사용.
 				if(!name.equals("gender"))			//이름이 gender가 아닐 경우
 					out.println("<li>" + name + " :  " + value + "</li>");
 				else {				//이름이 gender일 경우
 					if(value.equals("0"))
 						out.println("<li>" + name + " :  " + "여성" + "</li>");
 					else
 						out.println("<li>" + name + " :  " + "남성" + "</li>");
 				}
 			}else {			//이름이 hooby일 경우.
 				//낚시, 독서 ...	//취미가 복수로 들어오므로, 배열로 받아야함
 				String [] values = request.getParameterValues(name);
 				String hobby = "";
 				if(values == null || values.length == 0)		//취미 선택 안했다면
 					hobby = "";
 				else {		//취미를 한 개 이상 선택했다면
 					for(int i = 0 ; i < values.length; i++) {
 						hobby += values[i] + ", ";		
 					}		//32행에 의해 맨 마지막에 ", " 붙음
 					hobby = hobby.substring(0, hobby.length() - 1);		//0 ~ 제일 마지막 -1까지만 자름 	//제일 마지막인 ,를 자름.
 				}
 				out.println("<li>" + name + " : " +  hobby + "</li>");
 			}
 		}
 	%>
</ul>


