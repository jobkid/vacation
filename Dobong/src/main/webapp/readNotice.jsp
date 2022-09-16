<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>공지사항 내용</title>
	</head>
	<body>
		<%
		/*
			int num = Integer.parseInt(request.getParameter("number"));
			NoticeDAO notice = NoticeDAO.getInstance();
			NoticeBean nb = notice.getPost(num);
			
			
			String nick = nb.getNickname();
			String title = nb.getTitle();
			String write = nb.getWritingtime();
			String content = nb.getContent();
			*/
		%>
		<h1>공지사항</h1>
		<table border = "1">
			<tr>
				<th>작성자 : </th><th>제목 : </th><th>작성시간 : </th>
			</tr>
			<tr>
				<td>${data.getNickname() }</td><td>${data.getTitle() }</td><td>${data.getWritingtime() }</td>
			</tr>
			<tr>
					<td rowspan="3">${data.getContent() }</td>
			</tr>
		</table>
	</body>
</html>