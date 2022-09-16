<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>forward 되는 페이지</title>
	</head>
	<body>
		<h1>Forward Tag Example2</h1>
		<%
			String iden = request.getParameter("id");
			String secrete = request.getParameter("pwd");
		%>
		당신의 아이디는 <b><%=iden %></b>이고<p/>
		패스워드는 <b><%=secrete %></b>입니다.
	</body>
</html>