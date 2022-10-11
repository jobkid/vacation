<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>삭제 처리기</title>
	</head>
	<body>
		<h1>삭제 후 로그 아웃 처리</h1>
		<jsp:forward page = "Logout.do">
			<jsp:param name="id" value="${login.id}"/>
		</jsp:forward>
	</body>
</html>