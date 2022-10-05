<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>응답 값</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			String value = request.getParameter("search");
		%>
		<%=value %>
	</body>
</html>