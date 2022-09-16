<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>두번째 페이지</title>
	</head>
	<body>
		<%
			//request.getParameter("해당 input의 name");
			String first1=request.getParameter("first");
			String second1=request.getParameter("second");
		%>
		<h1>첫번째로 입력받은 내용 : <%=first1 %></h1>
		<h2>두번째로 입력받은 내용 : <%=second1 %> </h2>
		<!-- a 태그의 링크 주소 부분에 get방식 데이터를 적어 넣어서 전송이 가능 -->
		<a href="welcome.jsp?first=data1&second=data2">눌러서 이용</a>
	</body>
</html>