<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>단편소설 페이지</title>
	</head>
	<body>
		<div>
			<form method="get" action="ReadPage">
			<input type="hidden" name="currentPage" value=1>
				<select name="recordsPage">
					<option value="5">5개씩 보기</option>
					<option value="10">10개씩 보기</option>
					<option value="15">15개씩 보기</option>
				</select>
				<input type=button value="보기" onclick="">
				<a href="write.jsp">글쓰기</a>
			</form>
		</div>
	</body>
</html>