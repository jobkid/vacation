<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>수정하기</title>
	</head>
	<body>
		<div id="wrap">
			<form method="post" action = "UpdateShort.do">
				닉네임 : <input name="nick" value = "${sb.getNickname() }"><br><!-- 멤버 닉네임에서 가져올 것 -->
				제목 : <input name="title" value = "${sb.getTitle() }" ><br>
				본문 : <hr> <textarea name="content">${sb.getContent() }</textarea><br>
				<input type="submit" value="완료"><button type="reset" value="초기화">초기화</button>
			</form>
		</div>
	</body>
</html>