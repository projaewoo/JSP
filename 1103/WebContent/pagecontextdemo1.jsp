<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	String userage = request.getParameter("userage");
	if(username == null && userage == null) {
		username = "";
		userage = "0";
	}
	int age = Integer.parseInt(userage);
	if(age < 10 && age > 0) {
		//response.sendRedirect("https://jr.naver.com/");			//Redirect : 다른 사이트로 이동 가능 (단점 : 다른 사이트로 넘어갈때 다른 정보 (이름 등...) 못보냄)	//forward : 다른 사이트로 이동 X
		pageContext.forward("/a.jsp");	//a.jsp로 이동.	//  파라미터에 /로 시작	= 상대경로 = 1103에서만 가능 =다른 사이트 이동 불가!
	}else if(age >= 10 && age < 65) {
		pageContext.forward("/register.jsp");
    }else if(age >= 65 ){
		response.sendRedirect("/../1102/gugudan.jsp");			//   	/../   : 나(/) -> 부모(../)로
	}
	%>



<%-- form의 action에 아무것도 쓰지 않으면 자기가 자신을 부름. --%>
<form >
	Name : <input type = "text" name = "username" /> <br/>
	Age : <input type = "number" name = "userage" /> <br/>
	<button>전송하기</button>
</form>