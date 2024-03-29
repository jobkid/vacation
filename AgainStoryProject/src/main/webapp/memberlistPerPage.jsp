<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<input type="hidden" name = "search" value = "${search}">
			<input type="hidden" name = "category" value = "${category}">
			<select name = "recordsPerPage"><!-- 따라서 주소는 ShowShortList.do?currentPage=값&number=값&recordsPerPage=값 -->
				<option value = "5">5개 보기</option>
				<option value = "10" selected>10개 보기</option>
				<option value = "15">15개 보기</option>
			</select>
			<input type = "submit" value = "보기">
		</form>
	</body>
</html>