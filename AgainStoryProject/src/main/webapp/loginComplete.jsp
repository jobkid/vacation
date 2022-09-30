<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>로그인 완료</title>
		<link rel="stylesheet" href = "CSS/loginComplete.css">
	</head>
	<body>
		<div id="wrap">
		<%
			Calendar cal = Calendar.getInstance();
			int thisYear = cal.get(Calendar.YEAR);
			int thisMonth = cal.get(Calendar.MONTH);
			int thisDate = cal.get(Calendar.DATE);
		%>
		<h1>안녕하세요. 오늘은 <%=thisYear%>년 <%=thisMonth+1 %>월 <%=thisDate %>일입니다.
			<c:if test="${login.getId()!=null }">
				${login.getId() }님 ${message } 오늘도 건필하세요.<a href="Logout.do">로그아웃</a></h1>
			</c:if>
		</div>
		<!-- 이곳에 로그인을 하면 로그아웃 메뉴가 뜨도록 한다. -->
	</body>
</html>