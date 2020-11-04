<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.File" %>
<%-- 방문자 수 찍는 방법. --%>
<%-- 이 파일을 웹브라우저에서 refresh하면 count.txt의 숫자가 올라감. --%>
<%--inputStream (저장), outputStream  class 방식.
			-	ex) 5번째 곡을 듣기 위해 1, 2, 3, 4 번 곡 지나쳐야함.
		RandomAccessFile class 방식
			-	ex) 5번째 곡을 듣기 위해 5번째 곡 위치에 핀을 놓으면 바로 들을 수 있음.
			-	읽고, 쓰기 동시에 가능.
 --%>
<%@ page import = "java.io.RandomAccessFile" %>
<%-- 멤버 메소드 선언. --%>
<%!
	//방문자 숫자에 따른 이미지(숫자 그려진 이미지)를 보여주는 메소드.
	private String intConvertToImage(int count) {
		String str = "";
		String strCount = String.valueOf(count);		
		for(int i = 0 ; i < (6 - strCount.length()); i++){
			str += "<img src = 'images/0.png' />";
		}
		for(int i = 0 ; i < strCount.length(); i++) {
			str += "<img src = 'images/" + strCount.charAt(i) + ".png' />";
		}
		return str;
	}
%>     
<%
	String path = application.getRealPath("/");		//1104 context의 물리적 경로.	//path : ~~/wtpwebapps/1104/
	/*
		Eclipse의 경우.
		path : /Users/projaewoo/Documents/WebHome/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/1104/
	*/
	path += "WEB-INF/count.txt";	//path : ~~~/1104/WebContent/WEB-INF/count.txt
	RandomAccessFile raf = new RandomAccessFile(new File(path), "rw");			//rw : read & write
	String strCount = raf.readLine();		//count.txt의 "100" 이라는 글자 읽음.
	int count = Integer.parseInt(strCount);		//"100" -> 숫자 100.
	count++;		//101
	
 %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 물리적 경로 가져오는 메소드.  --%>
	<%-- RealPath : <%= application.getRealPath("/") %> <br/> --%>
	<%-- RealPath : /Users/projaewoo/Documents/WebHome/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/1104/ --%>
	<%-- RealPath : <%= path %> <br/> --%>
	방문자 수 : <%= intConvertToImage(count) %>		<%-- 메소드 호출. --%>
</body>
</html>
<%
	//포인터 위치를 맨 앞으로 지정해줘야 refresh해도 그 위에 글자가 덮힘.
	raf.seek(0);
	//그냥 숫자로 저장하면 이상한 문자로 딸려서 저장됨. 따라서 글자로 저장!	//String.valueOf() : 무조건 string으로 변환.
	raf.writeBytes(String.valueOf(count));		//101을 저장
	raf.close();
%>