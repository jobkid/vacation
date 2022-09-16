<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jstl if 데이터 처리 페이지</title>
	</head>
	<body>
		<h1>일반 자바방식</h1>
		<%
			request.setCharacterEncoding("utf-8");
			String color=request.getParameter("color");
			int num=Integer.parseInt(color);
			
			if(num==1){
		%>		<span style="color:red;">빨강</span>
		<%
			}else{
		%>
				<span style="color:orange">주황</span>
		<% 		
			}
		%>	
		<!-- c:if는 test의 결과를 통해 실행 여부만을 판단할 수 있다. -->		
		<h1>c:if을 이용한 방식</h1>
		<c:if test="${param.color==1 }">
			<span style="color:red;">빨강</span>
		</c:if>
		
		<h1>c:choose를 이용한 방식</h1>
		<c:choose>
			<c:when test="${param.color==1}">
				<span style="color:red;">빨강</span>
			</c:when>
			<c:otherwise>
				<span style="color:orange;">주황</span>
			</c:otherwise>
		</c:choose>
	</body>
</html>