<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>메인 페이지</title>
		<style>
			#wrap{
				margin:0 auto;
				width: 300px;
				padding: 50px;
				border:10px solid lightgray;
			}
		</style>
	</head>
	<body>
		<form method="post">
		<div id="wrap">
			<a href="register.jsp">회원가입</a><br>
			<a href="member.jsp">회원조회</a><br>
			<a href="edit.jsp">회원정보 수정</a><br>
			<a href="erase.jsp">회원정보 삭제</a><br>
		</div>
		</form>
	</body>
</html>