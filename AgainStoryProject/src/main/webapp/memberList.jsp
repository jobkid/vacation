<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>회원목록 보기</title>
		<link rel="stylesheet" href="memberList.css">
	</head>
	<body>
		<jsp:include page="loginComplete.jsp"/>
		<h1>회원목록보기</h1>
		<div>
		<table border = "1">
			<thead>
				<tr>
					<td>이름</td><td>아이디</td><td>닉네임</td><td>이메일</td><td>전화번호</td><td>생년월일</td><td>주소</td><td>종족</td><td>가입일시</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${members }" var="memberList">
				<tr>
					<td>${memberList.getName() }</td>
					<td>${memberList.getId() }</td>
					<td>${memberList.getNickname() }</td>
					<td>${memberList.getEmail() }</td>
					<td>${memberList.getPhone() }</td>
					<td>${memberList.getBirthday() }</td>
					<td>${memberList.getPlace() }</td>
					<td>${memberList.getTribe() }</td>
					<td>${memberList.getJoindate() }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<form method="get" action="register.do">
			<select name = "column">
				<option value="all">전체</option>
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
	</body>
</html>