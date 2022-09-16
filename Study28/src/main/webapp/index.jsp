<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jstl의 활용</title>
	</head>
	<body>
		<c:set var="add" value="${3+5 }"></c:set>
		value = "add" : <c:out value="add"></c:out><br>
		value = "\${add }" : <c:out value="${add }"></c:out><br>
		<c:remove var="add"></c:remove>
		삭제 후 : <c:out value="${add }"></c:out>
		
		<a href="jstl_if.jsp">if문 사용하러가기</a>
		<a href="jstl_for.jsp">반복문 사용하러 가기</a>
		<a href="jstl_token.jsp">토큰 사용하러 가기</a>
	</body>
</html>