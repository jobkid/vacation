<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>페이지 당 목록 수</title>
		<link rel="stylesheet" href="CSS/memberlistPerPage.css">
	</head>
	<body>
		<form action = "register.do" method = "get"><!-- 개시글 목록을 바꿔 주면 갱신해야 하기 때문에 ShowShortListServlet.java로 이동한다. 일단 수정0920-->
			<input type="hidden" name = "currentPage" value = "1"><!-- 참고로 form태그안에 method가 get이라면 action에 주소값을 적지말고 hidden을 만들자 -->
			<select name = "recordsPerPage"><!-- 따라서 주소는 ShowShortList.do?currentPage=값&number=값&recordsPerPage=값 -->
				<option value = "5">단편 5개</option>
				<option value = "10" selected>단편 10개</option>
				<option value = "15">단편 15개</option>
			</select>
			<input type = "submit" value = "보기">
		</form>
	</body>
</html>