<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>글쓰기</title>
		<style>
			*{
				padding : 0;
			}
			#wrap{
				margin : 0 auto;
				border : 1px solid black;
				text-align : center;
			}
			textarea{
				width : 50%;
				height : 400%;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<form method="post" action = "post.do">
				닉네임 : <input name="nick"><br><!-- 멤버 닉네임에서 가져올 것 -->
				비밀번호 : <input type="password" name="pass"><br>
				제목 : <input type="text" name="title"><br>
				날짜 : <input type="date" name="writedate"><br>
				본문 : <hr> <textarea name="content"></textarea><br>
				<input type="submit" value="완료"><button type="reset" value="초기화">초기화</button>
			</form>
		</div>
	</body>
</html>