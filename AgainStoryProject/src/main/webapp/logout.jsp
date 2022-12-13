<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>로그아웃 완료</title>
		<link rel="stylesheet" href="CSS/logout.css"/>
	</head>
	<body>
		<div id="wrap">
		안전하게 로그아웃 되었습니다.
		<a href = "FirstShortList.do?number=0&recordsPerPage=10&currentPage=1">메인 페이지로 돌아가기</a>
		<jsp:include page = "goHome.jsp"/>
		</div>
	</body>
</html>