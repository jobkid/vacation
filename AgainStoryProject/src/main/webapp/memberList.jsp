<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>회원목록 보기</title>
		<link rel="stylesheet" href="CSS/memberList.css">
	</head>
	<body>
		<jsp:include page="loginComplete.jsp"/>
		<div id="wrap">
		<table border = "1">
			<caption>회원목록</caption>
			<thead>
				<tr>
					<td>이름</td><td>아이디</td><td>닉네임</td><td>이메일</td><td>전화번호</td><td>생년월일</td><td>주소</td><td>종족</td><td>가입일시</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${members }" var="memberList">
				<tr>
					<td>${memberList.name }</td>
					<td>${memberList.id }</td>
					<td>${memberList.nickname }</td>
					<td>${memberList.email }</td>
					<td>${memberList.phone }</td>
					<td>${memberList.birthday }</td>
					<td>${memberList.place }</td>
					<td>${memberList.tribe }</td>
					<td>${memberList.joindate }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<form method="get" action="register.do">
		<input type = "hidden" name ="recordsPerPage" value = "10">
		<input type = "hidden" name ="currentPage" value = "1">
			<select name = "category">
				<option value="num">전체</option>
				<option value="name">이름</option>
				<option value="id">아이디</option>
				<option value="nickname">닉네임</option>
				<option value="email">이메일</option>
				<option value="phone">전화번호</option>
				<option value="birthday">생년월일</option>
				<option value="place">주소</option>
				<option value="tribe">종족</option>
			</select>
			<input name = "search">
			<input type = "submit" value = "검색">
		</form>
		</div>
		<jsp:include page="memberlistPerPage.jsp"/>
		<ul id="page">
			<c:forEach begin = "1" end = "${nOfPage}" var = "i"><!-- for문이랑 기능이 값음 1페이지에서 마지막으로 설정한 페이지까지. 즉 registerServlet.java에서 받아온 키  -->
				<c:choose>
					<c:when test = "${currentPage eq i}">
						<li><a>${i}(현재)</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="register.do?currentPage=${i}&recordsPerPage=${recordsPerPage}&category=${category}&search=${search}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
		<jsp:include page="goHome.jsp"/>
	</body>
</html>