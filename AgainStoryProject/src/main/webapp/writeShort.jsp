<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>글쓰기</title>
		<link rel="stylesheet" href="CSS/write.css">
	</head>
	<body>
		<jsp:include page = "loginComplete.jsp"/>
		<div id="wrap">
			<form method="post" action = "post.do">
			<div id="user">
				닉네임 : ${login.getNickname()}<input type="hidden" value="${login.getNickname()}" name="nick"><br><!-- 멤버 닉네임에서 가져올 것 -->
				종족 : ${login.getTribe() }<br>
				비밀번호 : <input type="password" name="pass" id = "pass" placeholder="비밀번호를 입력해주세요."><br>
				제목 : <input type="text" name="title" id = "title" placeholder = "제목을 입력해주세요."><br>
			</div>	
				<hr><textarea name="content" id = "content" placeholder="글을 입력해주세요."></textarea><br>
				<input type="submit" value="완료" onclick="return writeCheck()"><button type="reset" value="초기화">초기화</button>
			</form>
		</div>
		<jsp:include page = "goHome.jsp"/>
	</body>
	<script>
		function writeCheck(){
			var pass = document.getElementById("pass");
			var title = document.getElementById("title");
			var content = document.getElementById("content");
			if(pass.value==""){
				alert("비밀번호를 입력해주세요.");
				pass.focus();
				return false
			}
			if(title.value==""){
				alert("제목을 입력해주세요.");
				title.focus();
				return false
			}
			if(content.value==""){
				alert("내용을 입력해주세요.");
				title.focus();
				return false
			}
			return true
		}
	</script>
</html>