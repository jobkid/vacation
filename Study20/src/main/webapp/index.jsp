<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="test.Sample" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>자바 클래스의 이용</title>
	</head>
	<body>
		<%
			Sample s = new Sample(4, 4);
		%>
		<h1><%=s.name %></h1>
		<h1><%=s.age %></h1>
		<h1><%=s.address %></h1>
		
		<%=s.makeTable(3, 5) %>
		<%=s.make %>
	</body>
</html>