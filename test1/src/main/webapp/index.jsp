<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>테이블 테두리</title>
		<style>
			#wrap{
				margin : 0 auto;
				width : 300px;
				border : 5px solod lightgray;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
		<form method="post" action="submit.jsp">
			<fieldset>
				<legend>크기 설정</legend>
				<input type="number" value="tr" name="trnum" placeholder="tr 수를 입력해주세요."><br>
				<input type="number" value="td" name="tdnum" placeholder="td 수를 입력해주세요ㅣ"><br>
				<input type="number" value="with" name="width" placeholder="td width"><br>
				<input type="number" value="height" name="height" placeholder="td height">
			</fieldset>
			<fieldset>
				<legend>테두리 설정</legend>
				<input type="color" value="bodercolor" name="bodercolor"><br>
				<input type="number" value="boderthick" name="thickness"> 
			</fieldset>
			<fieldset>
				<legend>배경색 설정</legend>
				<input type="color" value="backgroundcolor" name="backcolor">
			</fieldset>
			<input type="submit" value="만들기!" name="make">
		</form>
		</div>
	</body>
</html>