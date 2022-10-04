<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>로그인</title>
		<link rel = "stylesheet" href = "CSS/login.css">
	</head>
	<body>
		<div>
			<form method="post" action="Login.do" name="login">
				아이디 : <input type="text" id="inputid" name="id"><br>
				비밀번호 : <input type="password" id="inputpw" name="pwd"><br>
				<input type="submit" value="로그인" onclick = "return loginCheck()">
			</form>	
		</div>
		<jsp:include page = "goHome.jsp"/>
		<script>
			function loginCheck(){
				if(document.getElementById("inputid").value==""){
					alert("아이디를 작성하셔야 합니다.");
					document.getElementById("inputid").focus();
					return false
				}
				if(document.getElementById("inputpw").value.length==0){
					alert("비밀번호를 입력해주세요.");
					document.getElementById("inputpw").focus();
					return false
				}
				return true;
			}
		</script>
	</body>
</html>