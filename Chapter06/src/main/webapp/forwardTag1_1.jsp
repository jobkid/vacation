<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>forward 액션 태그 포워딩 되기 전 페이지</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
		%>
		<h1>Forward Tag Example1</h1>
		forward Tag의 포워딩 되기 전의 페이지입니다.
		<jsp:forward page="forwardTag1_2.jsp"/>
	</body>
</html>