<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	private String getCookieValue(String name, Cookie [] array) {
		String value = "";
		if(array == null) {					//쿠키 배열이 null이면 공백 리턴.
			return "";
		}else {									//쿠키 배열이 하나라도 차있으면.
			for(int i = 0 ; i < array.length; i++) {
				if(array[i].getName().equals(name)) {
					value = array[i].getValue();
				}
			}
			return value;
			}
		}
		
%>    
    
<% 
	Cookie [] array = request.getCookies();
%>

<%-- 쿠키 다 가져옴. --%>

<%-- declaration에서 메소드 선언 --%>


	<h1>Cookie Get</h1>
	<ul>
		<li>이름 : <%= getCookieValue("NAME", array) %></li>
		<li>나이 : <%= getCookieValue("AGE", array) %></li>
		<li>주소 : <%= getCookieValue("ADDRESS", array) %></li>
	</ul>
	<div>
		<button 
		onclick = "javascript:location.href = 'cookieset.jsp'; ">Cookie Set</button>		<!--  button 클릭하면 cookieset.jsp로 이동 -->
		<button onclick = "javascript:location.href = 'cookiemodify.jsp';">Cookie Modify</button>
		<button onclick = "javascript:location.href = 'cookiedelete.jsp';">Cookie Delete</button>
	</div>
