<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>세션데이터 가공페이지</title>
	</head>
	<body>
		<%
			//form을 통해 전송된 데이터는 request를 통해 전달된다.
			//한글데이터를 사용해야 하는 경우 utf-8을 해둔다.
			request.setCharacterEncoding("utf-8");
			String data="좋아하는 계절 : "+request.getParameter("data");
			
			session.setAttribute("key",data);
		%>
		<h1><%=data %></h1>
		<a href="view2.jsp">세션데이터 공유 확인</a>
	</body>
</html>