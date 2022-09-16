<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>JSP테그의 사용</title>
		<link rel="stylesheet" href="test.css">
	</head>
	<body>
		<div id="wrap">
			<jsp:include page="header.jsp"></jsp:include>
			<p>본문은 이곳에 작성합니다.</p>
			<p>내용이 다음과 같이 등장합니다.</p>
			<p>다음 페이지로 넘어가려면 <a href="next.jsp">여기</a>를 클릭하십시오.</p>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>