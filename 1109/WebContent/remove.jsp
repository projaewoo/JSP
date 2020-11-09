<%@ page import = "java.util.Vector"  pageEncoding="utf-8"%>
<%-- <%@ page session = "false" %> --%>    <%-- session 사용 x : menu.html, cart.jsp, remove.jsp 간의 변수 공유 X. --%>

<h1>삭제할 CD를 선택해 주세요.</h1>
<form>
    <select name="item">
        <option value="">-- 선택 --</option>
        <!-- session이므로 하나의 웹 브라우저에서 다른 페이지로 이동해서 cart 변수 공유 가능. -->
        <%
        	Vector<String> cart = (Vector<String>)application.getAttribute("mycart");
        	for(int i = 0 ; i < cart.size(); i++) {
        %>
        		<option value = "<%= cart.get(i) %>"><%= cart.get(i) %></option>		<!--  value : 서버에게 넘어가는 값. -->
        <% } %>		<%-- for 끝. --%>
    </select><br />
    <input type="hidden" name="step" value = "remove"><br/>        <!-- 삭제하려는 CD-->
    <input type="submit" value="카트에서 뺴기">

</form>