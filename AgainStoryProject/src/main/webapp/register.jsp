<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>회원가입 페이지</title>
		<style>
			*{
				margin:12px auto;
				padding:0;
				/*text-align:center;*/	
			}
			h1{
				text-align:center;
			}
			#wrap{
				border:1px solid pink;
				
			}
		</style>
	</head>
	<body>
		<div id="wrap">
		<h1>여기는 회원가입 페이지입니다.</h1>
		<h1>"*"표시는 필수 입력 항목입니다.</h1>
			<form method="post" action="register.do" name="register">
				<table>	
					<tr>
						<td>이름 : </td>
						<td><input type="text" name="name" size="20">*</td>
					</tr>
					<tr>
						<td>아이디 : </td>
						<td>
							<input type="text" name="id">*
							<input type="hidden" name="reid">
							<input type="button" value="중복확인" onclick="">
						</td>
					</tr>
					<tr>
						<td>비밀번호 : </td>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<td>비밀번호 확인 : </td>
						<td><input type="password" name="pwdchk"></td>
					</tr>
					<tr>
						<td>닉네임 : </td>
						<td><input type="text" name="nickname">*</td>
					</tr>
					<tr>
						<td>이메일 : </td>
						<td><input type="text" name="email">*</td>
					</tr>
					<tr>
						<td>전화번호 : </td>
						<td><input type="text" name="phone">*</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="date" name="birthday">*</td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="place">*</td>
					</tr>
					<tr>
						<td>
							관리자<input type="radio" name="admin" value="1">
							일반 회원<input type="radio" name="admin" value="2">
							작가<input type="radio" name="admin" value="3">
						</td>
					</tr>
					<tr><td><input type="submit" value="회원가입 하기" onclick="return joinCheck()"><input type="reset" value="초기화"></td></tr>
				</table>
			</form>
		</div>
		<script>
			function idCheck(){
				if(document.register.id.value=""){
					alert("아이디를 입력해주세요.");
					document.register.id.focus();
					return;
				}				
			}
			function joinCheck(){
				if(document.register.name.value.length==0){
					alert("이름을 입력해주세요.");
					register.name.focus();
					return false;
				}
				
				if(document.register.id.value==0){
					alert("아이디를 입력해주세요.")
					register.id.focus();
					return false;
				}
				if(document.register.id.value.length<5){
					alert("아이디는 5문자 이상입니다.")
					register.id.focus();
					return false;
				}
				if(document.register.pwd.value==""){
					alert("비밀번호를 입력해주세요.")
					register.pwd.focus();
					return false;
				}
				if(document.register.pwd.value.length<=5||12<document.register.pwd.value.length){
					alert("비밀번호는 6자리 이상 12자리 미만으로 작성해주세요.")
					register.pwd.focus();
					return false;
				}
				if(document.register.email.value.length==0){
					alert("이메일 주소를 입력해주세요.")
					register.email.focus();
					return false;
				}
				if(document.register.phone.value==""){
					alert("전화번호를 입력해주세요.")
					register.phone.focus();
					return false;
				}
				if(document.register.birthday.value==""){
					alert("생년월일을 입력해주세요.")
					register.birthday.focus();
					return false;
				}
				if(document.register.place.value==""){
					alert("주소를 입력해주세요.")
					register.place.focus();
					return false;
				}
				if(document.register.admin.value==""){
					alert("회원 등급을 선택하세요.")
					return false;
				}
				return true;
			}
		</script>
	</body>
</html>