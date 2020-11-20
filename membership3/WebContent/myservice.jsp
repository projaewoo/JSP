<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="select" class="com.example.libs.service.SelectService" />
<c:if test="${empty userid}" ><%-- login을 하지 않았다면 --%>
	<c:redirect url="login.jsp" />
</c:if>    
<c:if test="${not empty userid }" >
	<c:set var="member" value="${select.selectMember(userid)}" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기 페이지</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap-theme.css" />
<style>
	.row{
		padding : 10px 200px;			<%--  위아래, 좌우 픽셀--%>
	}
</style>

<script src = "js/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		
		$('#btnHome').click(function() {			//id가 btnHome인 버튼을 클릭하면
			location.replace('index.html');
		});
		
		//id가 btnUpdate인 버튼을 클릭하면
		$('#btnUpdate').click(function() {
			if($(this).text() == '정보변경하기') {		 		//this : 이벤트 발생한 얘 (btnUpdate)  //btnUpdate의 텍스트가 '정보변경하기'라면.
				//현 페이지에서 이메일, 나이 칸이 텍스트박스로 변경되는 것 = jQuery
				let email = $('#email').text();			//let(자바스크립트 지역변수) ... if문에서만 사용가능.	//var (자바스크립트 전역변수) ... if문의 var email을 else if에서 사용가능	//emial의 값을 email에 저장.		//text() : span태그 사이의 값을 가져오기 위해서.
				$('#email').replaceWith("<input  id = 'txtEmail' type = 'email'   value = '" + email + "' />");
				
				let city = $('#city').text();
				//회원이 거주지 수정할 때, 회원의 원래 거주지가 select되게
				let str = "<select  id = 'selCity'>" +
								"<option value=\"서울\">서울</option>"  +
								"<option value=\"부산\">부산</option>"  +
								"<option value=\"대구\">대구</option>"  +
								"<option value=\"대전\">대전</option>"  +
								"<option value=\"광주\">광주</option>"  +
								"<option value=\"인천\">인천</option>"  +
								"<option value=\"울산\">울산</option>"  + 
					       "</select>";
				$('#city').replaceWith(str);
				
				//회원의 원래 거주지가 서울이라면, 서울을 select로 하고,
				//그렇지 않으면 서울을 select로 하지 않음.
				let array = ["서울", "부산", "대구", "대전", "광주", "인천", "울산"];		//자바스크립트의 변수형 : let
				let idx = array.indexOf(city);
				document.getElementById("selCity").options.selectedIndex = idx;		//idx에 해당하는 인덱스 = selCity의 옵션의 선택된 인덱스 (selCity에 해당 인덱스로 select맞춤.)
				
				//나이도 원래 회원의 나이로 업로드 되게끔.
				let age = $('#age').text();			//id가 age인 곳의 텍스트를 age에 저장.
				$('#age').replaceWith("<input id = 'txtAge'  type = 'number'  min = '0'  value = '" + age + "'  />");
	
				//정보변경하기 버튼을 정보변경완료로
				$('#btnUpdate').text('정보변경완료');
				//정보변경하기 버튼 -> 정보변경완료로 수정 후, btnUpdate의 클래스(속성)도 수정!
				$('#btnUpdate').removeClass();
				$('#btnUpdate').addClass("btn btn-danger");
			}else if($(this).text() == '정보변경완료') {		//this : 이벤트가 발생한 얘 (btnUpdate)  //btnUpdate의 텍스트가 '정보변경완료'라면
				let email = $('#txtEmail').val();		//id가 txtEmail인 곳에 바뀐 이메일을 넣음.
				let city = $('#selCity').val();
				let age = $('#txtAge').val();
				location.href = 
					'update.jsp?email=' + email + '&city=' + city + '&age=' + age;		//email, city, age의 값을 update_ok.jsp에게 보냄.
						//let : 자바스크립트의 지역변수 ... 위의 if문의 let과 else if문의 let은 다름.
			}
			
		});
		
		$('#btnDelete').click(function(){
			$('#btnDelete').on('click', function(){
				if(confirm("정말 탈퇴하시겠습니까 ? ")){
					location.replace("delete.jsp");
				}else{
					history.go(0);
				}
			});
		});
		
	});
</script>

</head>
<body>
	<h1 class="text-success" align="center" ><c:out value="${member.name}"/>님의 정보</h1>
	<div  class = "container">
		<div class = "row">
			<table class= "table table-bordered">
			
				<tr>
					<th class = "info">아이디</th><td>${userid}</td>
				</tr>
				<tr>
					<th class = "info">이메일</th>
					<td><span id = "email">${member.email }</span></td>		<!--  member.getEmial() -->
				</tr>																			<!--  el : get만 가능, set은 불가능! -->
				<tr>
					<th class = "info">성별</th>
					<td>
						<c:if  test = "${member.gender  eq 1 }">남성</c:if>
						<c:if  test = "${member.gender  eq 2 }">여성</c:if>
					</td>				
				</tr>
				<tr>
					<th class = "info">거주지</th>
					<td>
						<span  id = "city"><c:out  value = "${member.city }" /></span>
					</td>		<!--  member.getCity() -->
				</tr>
				<tr>
					<th class = "info">나이</th>
					<td>
						<span id = "age"><c:out  value = "${member.age }" /></span>
					</td>		<!--  member.getAge() -->
				</tr>
				
			</table>
		</div>
	</div>
	<div  class = "container">
		<div class = "row">
		
			<button type="button"  id = "btnHome" class="btn btn-success">홈으로</button>

			<button type="button" id = "btnUpdate"  class="btn btn-info">정보변경하기</button>

			<button type="button"  id = "btnDelete" class="btn btn-warning">탈퇴하기</button>
		
		</div>
	
	</div>
</body>
</html>