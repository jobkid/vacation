<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>EL의 스코프 범위</title>
	</head>
	<body>
		<%
			//scope : 데이터가 유지되는 범위
			//page scope : 현재 페이지
			//request scope : 리퀘스트 단위
			//session scope : 세션단위
			//application scope : 애플리케이션 단위
			
			pageContext.setAttribute("name", "page scope");
			request.setAttribute("name", "request scope");
			session.setAttribute("name", "session scope");//접속한 사람이 여러명이라면 각각 할 수 있게.. ex)로그인
			application.setAttribute("name", "application scope");//사용자마다 개별적으로 보이는게 아니라
																 //모두 똑같이 보일 수 있도록 ex)공지사항
		
		%>
		<!-- 아무 것도 지정하지 않은 경우 page scope를 기준으로 데이터를 가져온다. -->
		<h1>기본형 : ${name }</h1>
		<!-- 별도로 명시적인 scope범위를 지정하면 개별적으로도 사용이 가능하다. -->
		<h1>\${pageScope.name } : ${pageScope.name }</h1>
		<h1>\${requestScope.name } : ${requestScope.name }</h1>
		<h1>\${sessionScope.name} } : ${sessionScope.name }</h1>
		<h1>\${applicationScope.name } : ${applicationScope.name }</h1>
		
		<a href="test.jsp">스코프 범위 확인하러 가기</a>
	</body>
</html>