<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>다음의 내용을 전송합니다.</title>
		<style>
			#wrap{
				width:400px;
				border:5px solid lightgray;
				margin:0 auto;
			}
			#wrap input{
				width:80%;
				display:block;
				margin:0 auto;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<form method="post" action="submit.jsp">
				<fieldset>
					<legend>크기 설정</legend>
					<input type="number" placeholder="tr수를 입력해주세요" name="tr" min="1" max="5">
					<input type="number" placeholder="td수를 입력해주세요" name="td" min="1" max="5">
					<input type="number" placeholder="td width를 입력해주세요" name="tdwidth" min="10" max="50" step="10">
					<input type="number" placeholder="td height를 입력해주세요" name="tdheight" min="10" max="50" step="10">
				</fieldset>
				<fieldset>
					<legend>테두리 설정</legend>
					<input type="color" name="border">
					<input type="number" placeholder="border두께를 입력해주세요." name="px" min="1" max="5">
				</fieldset>
				<fieldset>
					<legend>배경색 설정</legend>
					<input type="color" name="background">
				</fieldset>
				<input type="submit" value="만들기" name="submit">
			</form>
		</div>
	</body>
</html>