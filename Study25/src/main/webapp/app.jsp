<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>애플리케이션 단위 테스트</title>
	</head>
	<body>
		<h1>application  단위에서는 항상 존속 확인</h1>
		<h1>\${page } : ${page }</h1>
		<h1>\${param.req } : ${param.req }</h1>
		<h1>\${ses } : ${ses }</h1>
		<h1>\${app } : ${app }</h1>
		<%
			application.removeAttribute("app");
		%>
		<h1>application단위 데이터 제거 후</h1>
		<h1>\${app } : ${app }</h1>
	</body>
</html>