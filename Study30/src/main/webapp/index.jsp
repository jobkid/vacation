<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Insert title here</title>
	</head>
	<body>
		<p>그냥 적은 거</p><!-- 서블릿이 다 읽어주고 있다. -->
		<%out.print("<p>자바로 적은 거</p>"); %>
		<a href="testServlet">get으로 서블릿 호출</a>
		<form method="post" action="testServlet">
			<input type="submit" value="post로 서블릿 호출">
		</form>
	</body>
</html>