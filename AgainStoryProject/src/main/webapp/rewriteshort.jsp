<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>글쓰기</title>
		<link rel="stylesheet" href = "CSS/write.css">
	</head>
	<body>
		<jsp:include page = "loginComplete.jsp"/>
		<div id="wrap">
			<form method="post" action = "UpdateShort.do">
			<input type = "hidden" value = "${sb.getNum() }" name = "num">
			<div id = "user">	
				닉네임 : ${sb.getNickname()}<br><!-- 멤버 닉네임에서 가져올 것 -->
				종족 : ${login.getTribe()}<br>
				비밀번호 :<input type="password" name="pass" value = " ${sb.getPass() }"><br>
				제목 : <input type="text" name="title" value = "${sb.getTitle() }"><br>
			</div>	
				<hr> <textarea name="content">${sb.getContent()}</textarea><br>
				<input type="submit" value="완료"><button type="reset" value="초기화">초기화</button>
			</form>
		</div>
		<jsp:include page = "goHome.jsp"/>
	</body>
</html>