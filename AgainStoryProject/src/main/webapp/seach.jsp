<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>검색</title>
	</head>
	<body>
		<form method="post" action="response.jsp">
			<select name = "element">
				<option value="all">전체</option>
				<option value="title">제목</option>
				<option value="nickname">작성자</option>
			</select>
			<input name = "search">
			<input type = "submit" value = "검색">
		</form>	
	</body>
</html>