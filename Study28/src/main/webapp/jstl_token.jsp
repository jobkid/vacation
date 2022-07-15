<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jstl 토큰 처리</title>
	</head>
	<body>
		<%
			String[] arr={"봄", "여름", "가을", "겨울"};
			String str="봄, 여름, 가을, 겨울";
			pageContext.setAttribute("season", str);
			String msg="iot,융합.프로그래밍?학과";
			pageContext.setAttribute("iot", msg);
		%>
		<!--토큰을 통하여 해당 데이터를 분리해 낼 수 있다.  -->
		<c:forTokens var="data" items="${season }" delims=",">
			${data }<br>
		</c:forTokens>
		<hr>
		<c:forTokens var="test" items="${iot }" delims=",.?">
			${test }<br>
		</c:forTokens>
		<p></p>
		pp
		<h1>jstl 포맷확인용</h1>
		<c:set var="num" value="1000000" scope="page"></c:set>
			fmt:number : <fmt:formatNumber value="${num }" type="number"></fmt:formatNumber>
		<!-- 데이터는 그대로 유지하되 보이는 형식을 바꾼다. -->
	</body>
</html>