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
				아이디 : <input type="text" id="inputid" name="id">
				비밀번호 : <input type="password" id="inputpw" name="pwd">
				<input type="submit" value="로그인" onclick = "#">
			</form>
		</div>
		<jsp:include page = "goHome.jsp"/>
		<script>
			function check(){
				if(document.getElementById("inputid").value==""){
					alert("아이디를 작성하셔야 합니다.")
					document.getElementById("inputid").focus();
					return false;
				}else if(document.getElementById("inputpw").value.length==0){
					document.getElementById("inputpw").focus();
					return false;
				}
				return true;
			}
		</script>
	</body>
</html>