<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jstl 반복문</title>
	</head>
	<body>
		<%
			String[]  season={"봄", "여름", "가을", "겨울"};
			//java for문
			for(int i=0; i<season.length; i++){
				out.print("<h3 style='color:red;'>"+season[i]+"</h3>");
			}
			
			//java 향상된 for문
			%>
				<hr>
			<%
			for(String str:season){
				out.print("<h3 style='color:blue;'>"+str+"</h3>");
			}
			%>
				<hr>
			<%
			for(int i=0; i<season.length; i++){
				String str=season[i];
				out.print("<h3 style='color:green;'>"+str+"</h3>");
			}
		
		
			pageContext.setAttribute("array", season);
		%>
		<hr>
		<!-- jstl forEach -->
		<!-- varStatus.index 순번, varStatus.count 횟수 -->
		<c:forEach var="str" items="${array }" varStatus="iter">
			<h3 style='color:purple;'>${str }:${iter.first }:${iter.last }</h3>
		</c:forEach>
		
		<%
			//for문 for문 쓰는 이유는 반복을 특정하기 위해
			for(int i=0; i<=10; i+=2){
				out.print("<h3 style='color:red;'>"+i+"</h3>");
			}
		%>
		<c:forEach var="i" begin="0" end="10" step="2" varStatus="status">
			<h3 style='color:blue;'>${i }:${status.index }:${status.count }</h3>
		</c:forEach>
	</body>
</html>