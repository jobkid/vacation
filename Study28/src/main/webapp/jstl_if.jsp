<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jstl if전송 페이지</title>
	</head>
	<body>
		<div id="wrap">
			<form method="post" action="select.jsp">
				색상을 선택하세요.
				
				<select name="color">
					<option value="1">빨강</option>
					<option value="2">주황</option>
					<option value="3">노랑</option>
					<option value="4">초록</option>
					<option value="5">파랑</option>
					<option value="6">남색</option>
					<option value="7">보라</option>
				</select>
				<input type="submit" value="전송!">
			</form>
		</div>
		<hr>
		<div>
			<form method="post" action="select2.jsp">
				과일을 선택하세요.
				<select name="fruit">
					<option value="1">사과</option>
					<option value="2">멜론</option>
					<option value="3">바나나</option>
				</select>
				<input type="submit" value="과일전송!">
			</form>
		</div>
	</body>
</html>