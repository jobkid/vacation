<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>기본 언어설정</title>
	</head>
	<body>
		<c:set var="date" value="<%=new java.util.Date() %>"></c:set>
		톰캣 서버의 기본 Locale확인 : <%=response.getLocale() %><br>
		
		<hr>
		<fmt:setLocale value="ko_kr"></fmt:setLocale>
		로케일을 한국어로 설정한 후 locale확인 : <%=response.getLocale() %><br>
		통화 : <fmt:formatNumber value="5000" type="currency"></fmt:formatNumber><br>
		날짜 : <fmt:formatDate value="${date }"></fmt:formatDate>
		<hr>
		<fmt:setLocale value="ja_jp"></fmt:setLocale>
		로케일을 일본어로 설정한 후 locale확인 : <%=response.getLocale() %><br>
		통화 : <fmt:formatNumber value="5000" type="currency"></fmt:formatNumber><br>
		날짜 : <fmt:formatDate value="${date }"></fmt:formatDate>
		
		<hr>
		<fmt:setLocale value="en_us"></fmt:setLocale>
		로케일을 영어로 설정한 후 locale확인 : <%=response.getLocale() %><br>
		통화 : <fmt:formatNumber value="5000" type="currency"></fmt:formatNumber><br>
		날짜 : <fmt:formatDate value="${date }"></fmt:formatDate>	
	</body>
</html>