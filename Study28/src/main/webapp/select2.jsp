<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>If-else-if 처리기</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			String str=request.getParameter("fruit");
			
			if(str.equals("1")){
				out.print("<h1 style='color:red';>사과</h1>");
				
			}else if(str.equals("2")){
				out.print("<h1 style='color:green;'>메론</h1>");
			}
			else if(str.equals("3")){
				out.print("<h1 style='color:yellow;'>바나나</h1>");
			}
		%>
		<hr>
		<c:choose>
			<c:when test="${param.fruit==1 }">
				<h1 style='color:red;'>사과</h1>
			</c:when>
			<c:when test="${param.fruit==2 }">
				<h1 style='color:green'>멜론</h1>
			</c:when>
			<c:when test="${param.fruit==3}">
				<h1 style='color:yellow;'>바나나</h1>
			</c:when>
		</c:choose>
	</body>
</html>