<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>로그아웃 완료</title>
	</head>
	<body>
		안전하게 로그아웃 되었습니다.
		<a href = "index.jsp">홈으로 돌아가기</a>
		<a href = "FirstShortList.do?number=0">메인 페이지로 돌아가기</a>
		<jsp:include page = "goHome.jsp"/>
	</body>
</html>