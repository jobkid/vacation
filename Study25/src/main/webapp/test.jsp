<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>scope 범위 테스트</title>
	</head>
	<body>
		<%
			pageContext.setAttribute("pag", "page단위의 데이터");
			session.setAttribute("ses", "session단위의 데이터");
			application.setAttribute("app", "application단위의 데이터");
		%>
		<h1>\${pag } : ${pag }</h1>
		<h1>\${req } : ${req }</h1>
		<h1>\${ses } : ${ses }</h1>
		<h1>\${app } : ${app }</h1>
		
		<a href="test.jsp">페이지 단위의 scope</a><br>
		<a href="#" onclick="sub()">리퀘스트 단위의 scope</a><br>
		<a href="session.jsp">세션 단위의 scope</a><br>
		<a href="app.jsp">애플리케이션 단위의 scope</a><br>
		
		<!-- 리퀘스트 하려면 폼은 줘야 한다. -->
		<form id="req1" method="get" action="request.jsp">
			<input type="hidden" name="req" value="request 단위의 데이터">
		</form>
		<script>
			let req=document.getElementById("req1");
			function sub(){
				req.submit();
			}
		</script>
	</body>
</html>