<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>회원가입 페이지</title>
		<style>
			#wrap{
				margin:100px auto;
				width:300px;
				padding:50px;
				border:10px solid lightgray;
			}
			span{
				display:inline-block; width:100px
			}
			input : last-chile{width:100px; diplay:block; margin:15px auto; text-align:center;}
		</style>
	</head>
	<body>
		<div id="wrap">
			<form method="get" action="insert.jsp">
				<span>아이디 : </span><input type="text" name="id"><br>
				<span>비밀번호 : </span><input type="password" name="pw"><br>
				<span>이름 : </span><input type="text" name="nm"><br>
				<span>이메일 : </span><input type="text" name="em"><br>
				<span>연락처 : </span><input type="text" name="ph"><br>
				<span>주소 : </span><input type="text" name="ad"><br>
				<input type="submit" value="회원가입!">
			</form>
		</div>
	</body>
</html>