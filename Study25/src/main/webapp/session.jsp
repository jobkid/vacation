<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>세션 단위 테스트</title>
	</head>
	<body>
		<h1>세션 정보 존속 중</h1>
		<h1>\${page } : ${page }</h1>
		<h1>\${param.req } : ${param.req }</h1>
		<h1>\${ses } : ${ses }</h1>
		<h1>\${app } : ${app }</h1>
		<%
			session.invalidate();//현재 사용자의 세션정보를 만료
		%>
		<h1>세션 정보 만료 후</h1>
		<h1>\${ses } : ${ses }</h1>
		<a href="test.jsp">페이지 단위의 scope</a><br>
		<a href="request.jsp">리퀘스트 단위의 scope</a><br>
		<a href="session.jsp">세션 단위의 scope</a><br>
		<a href="app.jsp">애플리케이션 단위의 scope</a><br>
	</body>
</html>