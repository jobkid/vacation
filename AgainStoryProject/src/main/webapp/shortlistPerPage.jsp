<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>게시판 목록 개수</title>
	</head>
	<body>
		<form action = "FirstShortList.do" method = "get"><!-- 개시글 목록을 바꿔 주면 갱신해야 하기 때문에 ShowShortListServlet.java로 이동한다. 일단 수정0920-->
			<input type="hidden" name = "currentPage" value = "1"><!-- 참고로 form태그안에 method가 get이라면 action에 주소값을 적지말고 hidden을 만들자 -->
			<c:choose>
				<c:when test="${number==0 }">
					<input type="hidden" name = "number" value = "0"><!-- 결론적으로 ShowShortList.do에 보내줄 파라미터(매개변수)은 currentPage, number, recordPerPage-->
				</c:when>
				<c:when test="${number==1 }">
					<input type="hidden" name = "number" value = "1">
				</c:when>
				<c:when test="${number==2 }">
					<input type="hidden" name = "number" value = "2">
				</c:when>
			</c:choose>
			<div id ="search&category">
				<select name="category">
					<option value = "num">전체</option>
					<option value = "title">제목</option>
					<option value = "nickname">작성자</option>
					<option value = "content">내용</option>
				</select>
				<input type = "text" name = "search">
			</div>	
				<select name = "recordsPerPage"><!-- 따라서 주소는 ShowShortList.do?currentPage=값&number=값&recordsPerPage=값 -->
					<option value = "5">단편 5개</option>
					<option value = "10" selected>단편 10개</option>
					<option value = "15">단편 15개</option>
				</select>
			<input type = "submit" value = "보기">
		</form>
	</body>
</html>