<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Insert title here</title>
	</head>
	<body>
		<jsp:include page = "loginComplete.jsp"/>
			<h1>글쓰기가 완료됐습니다.</h1>
			<a href="FirstShortList.do?number=0&recordsPerPage=10&currentPage=1">돌아가기</a>
		<jsp:include page = "goHome.jsp"/>
	</body>
</html>