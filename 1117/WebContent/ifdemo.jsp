<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib  prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>

<h1>좋아하시는 계절은?</h1>
<%-- form 태그에 action속성 사용 x = 자기 자신에게 넘김. --%>
<form method = "GET">
	Season : <input type = "radio"  name = "season"  value = "spring">봄&nbsp;&nbsp;
					<input type = "radio"  name = "season"  value = "summer">여름&nbsp;&nbsp;
					<input type = "radio"  name = "season"  value = "fall">가을&nbsp;&nbsp;
					<input type = "radio"  name = "season"  value = "winter">겨울&nbsp;&nbsp;<br/>
	<input type = "submit"  value = "전송!" />					
</form>
<hr/>

<%-- 첫 페이지인지 확인 --%>
<c:if  test = "${not empty param.season }">		<%-- 참 : param.season의 값이 있음. (첫 페이지가 아님) --%>
	<c:set  var = "myseason"  value = "${param.season }" />		<%-- 이름 : myseason, 값 : param.season --%>
	<c:if  test = "${myseason == 'spring' }">		<%-- EL : javaScript + xPath이므로 javaScript의 문자열 비교 연산자 == 사용 --%>
		<c:out value = "봄의 꽃 : 진달래, 개나리" />
	</c:if>
	<c:if  test = "${myseason == 'summer' }">
		<c:out value = "여름의 꽃 : 장미, 아카시아" />
	</c:if>
	<c:if  test = "${myseason == 'fall' }">
		<c:out value = "가을의 꽃 : 코스모스, 국화" />
	</c:if>
	<c:if  test = "${myseason == 'winter' }">
		<c:out value = "겨울의 꽃 : 동백, 매화" />
	</c:if>
</c:if>


