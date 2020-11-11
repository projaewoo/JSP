<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.example.libs.model.StudentVO" %>    
<jsp:useBean  id = "select"  class = "com.example.libs.service.SelectService" />
<%-- 기본생성자 호출함.   참조변수 : select --%>
<% 
	String hakbun = request.getParameter("hakbun");		//service에게 넘길 학번과 path	// list.jsp - > view.jsp로 배달.  //"view.jsp?hakbun="로 학번이 넘어옴.
	/* String path = application.getRealPath("/WEB-INF/oracle.properties");
	select.setPath(path); 		//4행의 select의 path을 setting */
	StudentVO student = select.select(hakbun); 		//service에게 학번 넘기면 //service는 student를 넘겨줌
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 상세 보기</title>

<link rel = "stylesheet"  href = "css/bootstrap.css"/>  <!--  bootstrap (CSS 라이브러리) 사용 위한 import -->
<script src = "js/jquery-3.5.1.js"></script>

<script>
	$(document).ready(function(){		//ready된 후의 function 호출.
		//목록보기 버튼 눌렀을 때,
		$('#btnList').on('click', function(){		//on() : 이벤트 등록  //off() : 이벤트 해제.
			location.href = "list.jsp";
		});
		//수정하기 버튼 눌렀을 때,
		$('#btnUpdate').on('click', function(){		//on() : 이벤트 등록  //off() : 이벤트 해제.
			location.href = "update.jsp?hakbun=<%=hakbun%>";		//update.jsp로 넘어갈 때, hakbun 가지고 가기.
		});
		//삭제하기 버튼 눌렀을 때,
		$('#btnDelete').on('click', function(){		//on() : 이벤트 등록  //off() : 이벤트 해제.
			if(confirm("정말 삭제하시겠습니까?")) {		//true or false		
				location.href = "delete.jsp?hakbun=<%=hakbun%>";			//삭제 한다면 delete.jsp로 hakbun을 가지고 이동.	(GET방식)	//Primary key (hakbun)로 삭제해야함.
			}else {		//삭제 안하겠다고 하면 (false)
				history.go(0);			//현재 페이지 유지.
			}
		});
	});
</script>

</head>
<body>

	<div class = "container">		
	<div class = "row">				<!--  bootstrap을 사용하기 위한 div 2개 -->
		<h1 class = "text-left">
			<%=student.getName()%>(<%=student.getHakbun() %>)'s Information
		</h1>
		
		<ul>
			<li>국어 : <%=student.getKor() %></li>
			<li>영어 : <%=student.getEng() %></li>
			<li>수학 : <%=student.getMat() %></li>
			<li>총점 : <%=student.getTot() %></li>
			<li>평균 : <%=student.getAvg() %></li>
			<li>평점 : <%=student.getGrade() %></li>		
		</ul>	
		<div>
			<button type = "button"  class = "btn btn-info"  id = "btnList">목록으로</button>
			<button type = "button"  class = "btn btn-success"   id = "btnUpdate">수정하기</button>
			<button type = "button"  class = "btn btn-danger"   id= "btnDelete">삭제하기</button>
		</div>
	</div>
	</div>
	
</body>
</html>