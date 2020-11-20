<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
		<%-- core 사용하기 위한 import. --%>    
    
<jsp:useBean  id = "update"  class = "com.example.libs.service.UpdateService" />
	<%-- UpdateService 기본생성자 호출. --%>
 
<jsp:useBean  id = "member"  class = "com.example.libs.model.MemberVO" />
	<%-- 기본생성자이므로 값 넣으려면 set 사용--%>
<jsp:setProperty  name = "member"  property = "userid"  value = "${sessionScope.userid }" />		<%-- userid변수에 session변수인 userid를 넣음 --%>
<jsp:setProperty  name = "member"  property = "email"  param = "email" />			<%-- db-> dao -> service -> 에서 넘어온 email을 emial변수에 저장. --%>
<jsp:setProperty  name = "member"  property = "city"  param = "city" />
<jsp:setProperty  name = "member"  property = "age"  param = "age" />
		<%-- 현재 userid, ... age가 MemberVO형 변수 member에 들어있음. --%>
		
<c:set  var = "row"  value = "${update.updateMember(member) }" />
		<%-- updateMember에서 반환한 row의 갯수를 row에 저장. --%>
		
<c:if  test = "${row  eq 1 }">		<%-- 업데이트 성공 --%>
	<c:redirect  url = "myservice.jsp" />		<%-- redirect : URL과 해당 본문내용 일치 --%>
</c:if>
<c:if  test = "${row  ne 1 }">		<%-- 업데이트 실패 --%>
	<script>
		alert("회원정보 수정 실패 ㅠㅠㅠ");
		history.back();
	</script>
</c:if>																