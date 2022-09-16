<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>인클루드 테스트</title>
		<link rel="stylesheet" href="test.css">
	</head>
	<body>
		<div id="wrap">
			<jsp:include page="header.jsp"></jsp:include>
			<h1>다음 페이지에 오신 것을 환영합니다.</h1>
			<h1>헤더와 푸터가 유지되고 있는 것을 확인.</h1>
			<p>공통되는 내용들을 포함시키면 편리합니다.</p>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>