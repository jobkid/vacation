<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>전송확인</title>
	</head>
	<body>
		<%
			//request 정보 해석 시 한글임을 반영하여 해석하도록 지정
			request.setCharacterEncoding("utf-8");
			String ptag=request.getParameter("ptag");
		%>
		<h1>전송받은 값 :<%=ptag %></h1>
	</body>
</html>