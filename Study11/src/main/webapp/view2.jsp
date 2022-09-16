<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>값 공유 확인</title>
	</head>
	<body>
		<%
			Cookie[] cookies=request.getCookies();
			for(int i=0; i<cookies.length; i++)
			{
				%><p>공유된 쿠키의 이름 : <%=cookies[i].getName()%></p>
				<p>공유된 쿠키의 내용 : <%=cookies[i].getValue()%></p><%
			}
			
		%>
	</body>
</html>