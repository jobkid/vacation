<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>페이지 당 목록 수</title>
		<link rel="stylesheet" href="CSS/memberlistPerPage.css">
	</head>
	<body>
		<form action = "MyBoard.do" method = "get"><!-- 개시글 목록을 바꿔 주면 갱신해야 하기 때문에 ShowShortListServlet.java로 이동한다. 일단 수정0920-->
			<select name="category">
				<option value = "title">제목</option>
				<option value = "nickname">작성자</option>
				<option value = "content">내용</option>
			</select>
			<input type = "text" name="search">
			<input type = "hidden" name = "nice" value = "${login.id}">
			<input type = "hidden" name = "current" value = "1"><!-- 참고로 form태그안에 method가 get이라면 action에 주소값을 적지말고 hidden을 만들자 -->
			<c:choose>
				<c:when test="${number==0&&number2==0 }">
					<input type = "hidden" name="number" value = "0">
					<input type = "hidden" name="number2" value = "0">
				</c:when>
				<c:when test="${number==login.id.hashCode()}">
					<input type = "hidden" name = "number" value = "${login.id.hashCode()}">
					<input type = "hidden" name = "number2" value = "0">
				</c:when>
				<c:when test="${number2==login.id.hashCode()}">
					<input type = "hidden" name = "number" value = "0">
					<input type = "hidden" name = "number2" value = "${login.id.hashCode()}">
				</c:when>
			</c:choose>
			<select name = "record"><!-- 따라서 주소는 ShowShortList.do?currentPage=값&number=값&recordsPerPage=값 -->
				<option value = "5">단편 5개</option>
				<option value = "10" selected>단편 10개</option>
				<option value = "15">단편 15개</option>
			</select>
			<input type = "submit" value = "보기">
		</form>
	</body>
</html>