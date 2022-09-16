<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>로그인</title>
	</head>
	<body>
		<div>
			<form method="post" action="Login.do" name="login">
				아이디 : <input type="text" name="id">
				비밀번호 : <input type="password" name="pwd">
				<input type="submit" value="로그인">
			</form>
		</div>
	</body>
</html>