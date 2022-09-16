<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>회원가입</title>
		<style>
			#wrap{
				margin:0 auto;
				width:300px;
				border:5px solid lightgray;
				padding:15px;
				}
			#wrap input{
				width:70%;
			}
			#wrap fieldset input{
				width:15px;
			}
			#wrap > form > input:last-child{
				display:block;
				margin:0 auro;
			}
			input[name="id"]{
				margin-left:48px;
			}
			input[name="name"]{
				margin-left:32px;
			}
			input[name="phone"]{
				margin-left:16px;
			}
		</style>
	</head>
	<body>
	<!-- 
		<form>
			<h1>회원가입</h1>
			<h3>ID : </h3>
			<input type="text" placeholder="아이디를 입력해주세요.">
			<h3>비밀번호 : </h3>
			<input type="password" placeholder="비밀번호를 입력해주시요.">
			<h3>이름:</h3>
			<input type="text" placeholder="성명을 입력해주세요.">
			<h3>연락처:</h3>
			<input type="number" placeholder="휴대전화번호를 입력해주세요">
		</form>
		<form>
			<legend>관심분야</legend>
			<input type="radio">
			
			<legend>수강과목</legend>
			<input type="checkbox">
			
			<input type="button" value="회원가입">
		</form>
		 -->
		 <div id="wrap">
		 	<form method="post" action ="welcome.jsp">
		 		<h1>회원가입</h1>
		 		<hr>
		 		ID : <input type="text" name="id" placeholder="아이디를 입력해주세요"><br>
		 		비밀번호 : <input type="password" name="pass" placeholder="비밀번호를 입력해주세요"><br>
		 		이름 : <input type="text" name="name" placeholder="성명을 입력해주세요."><br>
		 		연락처 : <input type="text" name="phone" placeholder="휴대전화번호를 입력해주세요"><br>
		 		<fieldset>
		 			<legend>관심분야</legend>
		 			JAVA<input type="radio" name="subject" value="java">
		 			HTML<input type="radio" name="subject" value="html">
		 			IOT<input type="radio" name="subject" value="iot">
		 		</fieldset>
		 		<fieldset>
		 			<legend>수강과목</legend>
		 			JSP<input type="checkbox" name="jsp">
		 			ANDROID<input type="checkbox" name="android">
		 		</fieldset>
		 		<hr>
		 		<input type="submit" value="회원가입">
	 		</form>
		 </div>
	</body>
</html>