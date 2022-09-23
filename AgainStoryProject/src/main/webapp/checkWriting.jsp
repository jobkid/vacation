<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<jsp:include page = "loginComplete.jsp"/>
		<h1>글쓰기가 완료됐습니다.</h1>
		<a href="shortList.jsp">돌아가기</a>
		<jsp:include page = "goHome.jsp"/>
	</body>
</html>