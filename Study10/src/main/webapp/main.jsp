<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>메인페이지</title>
	</head>
	<body>
		<%
			//session은 request와는 달리 저장되는 데이터가 String이 아니다.
			String ok=(String)session.getAttribute("login");
		
		%>
		<h1>여기는 메인 페이지 입니다.</h1>
		<h1>login결과 : <%=ok %></h1>
	</body>
</html>