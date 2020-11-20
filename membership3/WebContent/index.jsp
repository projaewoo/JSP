<%@ page contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="select" class="com.example.libs.service.SelectService" />
<c:if test="${not empty userid}">
	<c:set var="member" value="${select.selectMember(userid)}" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		$('#btnRegister').on('click', function(){
			location.href = "register.html";
		});
		$('#btnLogin').on('click', function(){
			location.href = "login.jsp";
		});
		$('#btnLogout').on('click', function(){
			if(confirm("정말 로그아웃하시겠습니까 ? ")){
				location.replace("logout.jsp");
			}else{
				history.go(0);
			}
		});
		$('#btnDelete').on('click', function(){
			if(confirm("정말 탈퇴하시겠습니까 ? ")){
				location.replace("delete.jsp");
			}else{
				history.go(0);
			}
		});
		$('#btnMyservice').on('click', function(){
			location.replace('myservice.jsp');
		});
	});
</script>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="jumbotron">
      	<c:if test="${empty userid}">
        	<h1>Welcome to www.example.com</h1>
        </c:if>
        <c:if test="${not empty userid}">   <%-- 로그인 했다면 --%>
        	<c:if  test = "${flag eq 1 }">			<%-- flag : session변수이므로 굳이 이 파일에서 선언 안해도 사용가능. --%>
        		<h1 class = "text-success">${member.name}님! 환영합니다.</h1>
        	</c:if>
        	<c:if  test = "${flag eq 0 }">		<%-- 관리자라면 --%>
        		<h2  class = "text-danger">Welcome 관리자!</h2>
        	</c:if>
        </c:if>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum, vel ut. Fuga nemo dolores, voluptatibus et aliquam mollitia reiciendis quo qui vitae eum obcaecati! Mollitia dignissimos incidunt ipsum quis adipisci.
        Sit nesciunt modi maxime eius quisquam numquam voluptas odit similique sunt voluptatibus, autem magni quis ea vero quo alias debitis adipisci perspiciatis doloremque corrupti fuga animi unde quidem. Error, omnis.
        Fuga adipisci tempora eligendi amet ullam rem ut eveniet est! Quod voluptate laudantium fugit! Cum deserunt minima modi ab quia deleniti eaque ratione, magnam soluta totam ad tempora qui praesentium!
        Provident accusamus sapiente, doloribus quibusdam enim consequatur eum eius vel temporibus officiis natus nostrum excepturi qui illum facilis, voluptatibus nobis corporis perspiciatis fugit accusantium nisi! Cumque quidem enim iusto. Saepe?
        Doloribus ut beatae cupiditate expedita quam porro earum praesentium, tempore tempora eaque eligendi, delectus reprehenderit sed culpa. Quis deleniti veritatis consectetur distinctio quidem placeat quisquam. Libero qui nemo animi impedit.</p>
        <p>
        	<c:if test="${empty userid}"><%--login 안했을 때 --%>
        		<button id="btnRegister" class="btn btn-success btn-lg">회원가입</button>
        		<button id="btnLogin" class="btn btn-info btn-lg">Log In</button>
        	</c:if>
        	<c:if test="${not empty userid}"><%--login 했을 때 --%>
        	
        		<button id="btnLogout" class="btn btn-warning btn-lg">Log Out</button>
        		
        		<c:if test = "${member.flag  eq 1} ">		<%-- 일반 유저라면 버튼 : My Service, 회원탈퇴 --%>
        			<button id="btnMyservice" class="btn btn-info btn-lg">My Service</button>
        			<button id="btnDelete" class="btn btn-danger btn-lg">회원탈퇴</button>
        		</c:if>
        		<c:if  test = "${member.flag  eq 0 }" >		<%--관리자로 로그인 시, 로그아웃 버튼만 보이게 --%>
        			<%-- bootstrap의 css 이용 --%>
        			<%-- 앵커이므로 버튼 위에 마우스 올리면, 밑에 URL보임. --%>
        			<a class="btn btn-primary btn-lg" href="admin.jsp" role="button">관리자 페이지</a>
        		</c:if>
        		
        	</c:if>
        </p>
      </div>
    </div>
  </div>
</body>
</html>