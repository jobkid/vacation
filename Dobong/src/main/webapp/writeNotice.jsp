<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>공지사항 작성</title>
		<style> 
			#wrap{
				margin : 0 auto;
				padding : 0; 
			}
			textarea{
				width : 800px;
				height : 300px;
			}
		</style>
	</head>
	<body>
	<h1>공지사항 작성하기</h1>
		<div id="wrap">
			<form method="post" action="WriteNotice.Do"><!-- WriteNoticeServlet으로 전송 -->
				작성자<input name="nickname"><br>
				제목 <input name="title"><br>
				내용<br><textarea placeholder="내용을 입력해주세요." name="content"></textarea><br>
				<input type = "submit" value="완료"><input type="reset">
			</form>
		</div>
	</body>
</html>