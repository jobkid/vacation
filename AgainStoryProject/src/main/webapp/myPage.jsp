<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>마이페이지</title>
		<link rel="stylesheet" href="CSS/myPage.css">
	</head>
	<%  
		 
	%>
	<body>
		<jsp:include page="loginComplete.jsp"/>
		<div id="wrap">
			<div id="usermenu">
				마이페이지입니다.<br>
				<a href = "UpdateMember.do?nice=${login.getId().hashCode() }">회원정보 수정하기</a><br>
				<a href = "DeleteMember.do?nice=${login.getNum() }">회원 탈퇴하기</a><br>
				<a href = "MyBoard.do?nice=${login.id }&current=1&record=10&number=${0}&number2=${0}">내 글 확인하기</a>
			</div>
			<div id="userInformation">
				<table>	
					<tr>
						<td>이름</td><td>${login.name }</td>
					</tr>
					<tr>
						<td>아이디</td><td>${login.id}</td>
					</tr>
					<tr>
						<td>닉네임</td><td>${login.nickname }</td>
					</tr>
					<tr>
						<td>이메일</td><td>${login.email }</td>
					</tr>
					<tr>
						<td>전화번호</td><td>${login.phone }</td>
					</tr>
					<tr>
						<td>생년월일</td><td>${login.birthday}</td>
					</tr>
					<tr>
						<td>주소</td><td>${login.place }</td>
					</tr>
					<tr>
						<td>종족</td>
						<c:choose>
							<c:when test="${login.tribe == '외계인'}">	
								<td>외계인</td>
							</c:when>
							<c:otherwise>
								<td>마법사</td>
							</c:otherwise>
						</c:choose>	
					</tr>
				</table>
			</div>
		</div>
		<jsp:include page="goHome.jsp"/>
	</body>
</html>