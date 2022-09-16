<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>소설 읽기</title>
		<style>
			*{
				margin : 0 auto;
				padding : 0;
			}
		</style>
	</head>
	<body>
		<div id = "wrap">
			<div>
				<table border="1">
					<tr>
						<th>번호</th><th>작성자</th><th>쓰기 시간</th>
					</tr>
					<tr>
						<td>${sb.getNum() }</td><td>${sb.getNickname() }</td><td>${sb.getWritingdate() }</td>
					</tr>
					<tr>
						<td colspan = "3">${sb.getContent() }</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>