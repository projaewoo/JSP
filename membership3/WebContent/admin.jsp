<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 관리자 페이지 : 전체 회원 명단 보여줌. --%>

<%@ page import = "java.util.ArrayList" %>
		<%-- ArrayList사용을 위한 import --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:useBean id = "select"  class = "com.example.libs.service.SelectService" />
		<%-- SelectService의 기본생성자 호출. --%>
	
<c:set var = "list"  value = "${select.selectAll() }" />
	<%-- 모든 회원정보를 담은 ArrayList를 list에 저장. --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<script src="js/jquery-3.5.1.js"></script>

</head>
<body>

	<div class="container">
   		 <div class="row">
   		 	<h1>전체 회원 리스트</h1>
   		 		
   		 		<%-- bootstrap의 css에서 가져온 이쁜 테이블. --%>
   		 	<table class="table table-hover">
   		 		<thead>
   		 			<tr>
   		 				<th>User ID</th><th>Name</th><th>Email</th>
   		 				<th>Gender</th><th>City</th><th>Age</th>
   		 			</tr>
   		 		</thead>
   		 		<tbody>
					<c:forEach  items = "${list }"  var = "member"  >		<%-- 반복의 대상 : items   ... list에서 한 회원을 빼서 member에 저장.--%>
											<%-- trim을 사용하기 위한 접두사 fn --%>
						<c:if  test = "${fn:trim(member.userid)  ne  'admin' }" >		<%-- 관리자가 아니라면... 회원이라면 --%>
							<tr>
									<td>${member.userid }</td><td>${member.name }</td>		<%-- 41행에서 회원정보를 저장한 member변수 사용 --%>
									<td>${member.email }</td>
									<td>
										<c:if  test = "${member.gender  eq  1 }">
											남성
										</c:if>
										<c:if  test = "${member.gender  eq  2 }">
											여성
										</c:if>
									</td>
									<td>${member.city }</td><td>${member.age }</td>
							</tr>
						</c:if>
					</c:forEach>
   		 		</tbody>
   		 		
			</table>
   		 
   		</div>
   	</div>


</body>
</html>