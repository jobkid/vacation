<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<title>EL과 JSTL 사용</title>
	</head>
	<body>
		<%
			String var="자바단위의 데이터";
			pageContext.setAttribute("page", "페이지단위");
			request.setAttribute("request", "리퀘스트 단위");
			application.setAttribute("application", "앱단위");
		%>
		<h1>EL의 출력</h1>
		\${var } : ${var }<br><!-- EL과 자바는 별개다. 직접 변수를 참조할 수 없다. -->
		\${page } : ${page }<br><!-- 페이지 스코프하면 된다. -->
		\${request } : ${request }<br>
		\${application } : ${application }
		
		<c:set var="page" value="페이지단위" scope="page"></c:set>
		<c:set var="request" value="리퀘스트 단위" scope="request"></c:set>
		<c:set var="session" value="세션단위" scope="session"></c:set>
		<c:set var="application" value="앱단위" scope="application"></c:set>
		<h1>JSTL의 출력</h1>
		<c:out value="${page }"></c:out><br>
		<c:out value="${request }"></c:out><br>
		<c:out value="${session }"></c:out><br>
		<c:out value="${application }"></c:out><!--  -->
	</body>
</html>