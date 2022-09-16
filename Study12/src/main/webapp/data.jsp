<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>세션데이터 출력</title>
	</head>
	<body>
		<%
			//세션에서 값을꺼낼때는 session.getAttribute(key);로 추출한다.
			//리턴타입이 Object이므로 추출시에 주의한다.
			String data=(String)session.getAttribute("msg");
		%>
		<h1><%=data %></h1>
	</body>
</html>