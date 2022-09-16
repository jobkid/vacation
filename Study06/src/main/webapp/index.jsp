<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>첫번째 페이지입니다.</title>
	</head>
	<body>
		<!-- form태그 내부에는 submit이 있어야 전송이 가능하며 -->
		<!-- 전송될 데이터가 적히는 input은 반드시 name값이 있어야 한다. -->
		<form method="get" action="welcome.jsp">
			<input type="text" name="first" placeholder="첫번째 값"><br>
			<input type="text" name="second" placeholder="두번째 값"><br>
			<input type="submit" value="전송">
			<%--폼 안에 있는 자기 인풋값을 전부 전송한다. --%>
		</form>
	</body>
</html>