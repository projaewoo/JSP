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
		response.sendRedirect("https://jr.naver.com/");			//Redirect : 다른 사이트로 이동 가능 (단점 : 다른 사이트로 넘어갈때 다른 정보 (이름 등...) 못보냄)	//forward : 다른 사이트로 이동 X
	}else if(age >= 10 && age < 65) {
%>    
<script>
	location.href = "./register.jsp";			//    ./  : 나라는 뜻		//10살 이상, 65세 미만이면 register.jsp로 가서 회원가입 해
</script>
<%}else if(age >= 65 ){
		response.sendRedirect("../1102/gugudan.jsp");
	}
	%>



<%-- form의 action에 아무것도 쓰지 않으면 자기가 자신을 부름. --%>
<form action = "">
	Name : <input type = "text" name = "username" /> <br/>
	Age : <input type = "number" name = "userage" /> <br/>
	<button>전송하기</button>
</form>