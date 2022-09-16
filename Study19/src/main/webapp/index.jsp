<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>메인 페이지</title>
	</head>
	<body>
		<div id="wrap">
			<p>이 아래로는 include된 부분입니다.</p>
			<jsp:include page="data.jsp">
				<jsp:param name="name" value="이주협"></jsp:param>
				<jsp:param name="name2" value='<%=URLEncoder.encode("이주협","utf-8") %>'></jsp:param>
			</jsp:include>
			<p>이 위로는 include된 부분입니다.</p>
		</div>
	</body>
</html>