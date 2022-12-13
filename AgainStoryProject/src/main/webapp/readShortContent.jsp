<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>소설 읽기</title>
		<link rel="stylesheet" href="CSS/write.css">
	</head>
	<body>
		<jsp:include page="loginComplete.jsp"/>
		<div id = "wrap">
			<div id = "content">
				<table border="1">
					<tr>
						<th>번호</th><th>작성자</th><th>쓰기 시간</th>
					</tr>
					<tr>
						<td>${sb.getNum() }</td><td>${sb.getNickname() }</td><td>${sb.getWritingdate() }</td>
					</tr>
					<tr>
						<td colspan = "3">${sb.getTitle() }</td>
					</tr>
					<tr>
						<td colspan = "3">${sb.getContent() }</td>
					</tr>
				</table>
		</div>
			<table border=1>
				<tr>
					<td>작성자</td><td>내용</td><td>작성시간</td>
				</tr>
				<c:forEach var="comment1" items="${comment}">
					<tr>
						<td>${comment1.nickname }</td><td>${comment1.comment }</td><td>${comment1.commenttime }</td>
					</tr>
				</c:forEach>	
			</table>
			<div id = "pageOfNumber">
				<c:choose>
					<c:when test="${not empty comment}">	
					<ul>
						<c:forEach var="i" begin="1" end="${nOfPage }">	
								<c:choose>
									<c:when test = "${current eq i }">
										<li>${i }(현재)</li>			
									</c:when>
									<c:otherwise>
										<li><a href="ReadContent.do?num=${sb.num }&currentPage=${i }&recordsPerPage=${recordsPerPage}">${i }</a></li>
									</c:otherwise>
								</c:choose>
						</c:forEach>
					</ul>
					</c:when>
					<c:otherwise>
						댓글이 없습니다.
					</c:otherwise>
				</c:choose>		
			</div>
			<div id="comment">
				<form action="Comment.do" method="post">
					<h2>${login.getNickname()}</h2>
					<input type = "hidden" name = "nickname" value = "${login.getNickname()}">
					<input type = "hidden" name = "title" value = "${sb.getTitle() }">
					<input type = "hidden" name = "num" value = "${sb.getNum() }">
					<textarea placeholder="댓글을 입력해주세요." name = "comment" style="width : 40%; height : 30%;"></textarea>
					<input type = "submit" value = "입력">
				</form>	
			</div>
		</div>
		<form method="get" action = "deleteShort.do">
			<input type = "hidden" value = "1" name = "number">
			<input type = "submit" value = "삭제">
		</form>
		<jsp:include page = "goHome.jsp"/>
	</body>
</html>