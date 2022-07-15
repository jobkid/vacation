<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>세션 데이터의 공유 처리</title>
	</head>
	<body>
		<form method="get" action="view1.jsp">
			좋아하는 계절은?
			<select name="data">
				<option>여름</option>
				<option>아주 더운 여름</option>
				<option>겨울</option>
				<option>눈 오는 겨울</option>
			</select>
			<input type="submit" value="전송">
		</form>
	</body>
</html>