<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.example.libs.model.StudentVO" %>		<%-- 11행에서 StudentVO student를 사용하기 위해 --%>    
<jsp:useBean  id = "select"  class = "com.example.libs.service.SelectService" />		<%-- 11행의 앞의 select = com.example.libs.service.SelectService --%>
 <jsp:useBean  id = "update"  class = "com.example.libs.service.UpdateService" />
    
<%
	String hakbun = request.getParameter("hakbun");
	/* String path = application.getRealPath("/WEB-INF/oracle.properties");
	select.setPath(path);		//useBean에서 id가 select인 곳에 path넘김.	//com.example.libs.service.SelectService에 path넘김. */
	StudentVO student = select.select(hakbun);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 점수 수정 페이지</title>
<script src = "js/jquery-3.5.1.js"></script>		<!--  jQuery 사용 -->
<link rel = "stylesheet"  href = "css/bootstrap.css"/>  <!--  bootstrap (CSS 라이브러리) 사용 위한 import -->

<script>
	$(document).ready(function(){
		$('#txtKor').val(<%=student.getKor()%>);		//id가 txtKor인 값에 student.getKor() 넣음.
		$('#txtEng').val(<%=student.getEng()%>);
		$('#txtMat').val(<%=student.getMat()%>);
		$('#txtTot').val(<%=student.getTot()%>);
		$('#txtAvg').val(<%=student.getAvg()%>);
		$('#txtGrade').val('<%=student.getGrade()%>');
		
		//버튼이 클릭 이벤트 부여
		$("button[type='button']").on('click', function(){	//버튼 중에 타입이 버튼인 것의 클릭 이벤트 발생 시
			history.back();
		}); 			 
	});
</script>

</head>
<body>
	
	<div class = "container">		
	<div class = "row">				<!--  bootstrap을 사용하기 위한 div 2개 //div 2개 안에 form이 위치해야함.-->
	<h1 class = "text-left">
			<%=student.getName()%>(<%=student.getHakbun() %>)'s 수정 페이지
	</h1>
	
	<form  action = "update_ok.jsp"  method = "POST"> 		<!--  전송하면 update_ok.jsp로 POST방식으로 학번, 국어, 영어 수학 넘어감.-->
		<input type = "hidden"  name = "hakbun"  value = "<%= hakbun %>" />		<!-- 유저에게 안보임. 그러나 학번을 반드시 보내야하므로 hidden으로 안보이게 하고, 보냄.-->	
		
		<ul>
			<li>국어 : <input  type = "number"  max = "100"  min = "0"  name = "kor"  id = "txtKor"  /></li>		<!--  name : server에 넘어가는 이름. -->
			<li>영어 : <input  type = "number"  max = "100"  min = "0"   name = "eng"  id = "txtEng"  /></li>		
			<li>수학 : <input  type = "number"  max = "100"  min = "0"   name = "mat"  id = "txtMat"  /></li>		
			<li>총점 : <input  type = "text"   id = "txtTot"  readonly /></li>		<!--  읽기 전용 ,server에 안넘어가서 name 안씀 -->	<!--  id : jQuery 사용할 것이므로. -->	
			<li>평균 : <input  type = "text"  id = "txtAvg"  readonly /></li>		
			<li>평점 : <input  type = "text"  id = "txtGrade"  readonly /></li>
			<li><button  type = "submit"  class = "btn btn-warning">수정하기</button>	
				  <button  type = "button"  class = "btn btn-danger">취소하기</button>
			</li>	
		</ul>
		
	</form>
	</div>
	</div>
	
</body>
</html>