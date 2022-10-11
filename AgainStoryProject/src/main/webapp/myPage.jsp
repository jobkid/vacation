<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.util.*" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>마이페이지</title>
	</head>
	<%  
		 
	%>
	<body>
		마이페이지입니다.<br>
		<!-- x${login.getId().hashCode()}<br>-->
		<a href = "UpdateMember.do?nice=${login.getId().hashCode() }">회원정보 수정하기</a><br>
		<a href = "DeleteMember.do?nice=${login.getNum() }">회원 탈퇴하기</a><br>
		<a href = "MyBoard.do?nice=${login.id }">내 글 확인하기</a>
		<h1>내 정보 추가하기</h1>
	</body>
</html>