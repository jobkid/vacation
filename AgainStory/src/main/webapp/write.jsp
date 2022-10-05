<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>글쓰기 게시판</title>
		<style>
			*{
				margin : 12px auto;
				padding : 0;
			}
			#wrap{
				border : 1px solid black;				
			}
			
		</style>
	</head>
	<body>
		
		<div id="wrap">
			<form method="post" action="write.do" name="write">	
				비밀번호<input type="password" name=pwd><br>
				닉네임 : ${login.id }
				제목<input type="text" name="title"><br>
				내용<input type="text" name="content" id="content"><br>
				<input type="submit" name="완료">
			</form>	
		</div>
	</body>
</html>