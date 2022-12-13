<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>단편소설</title>
		<link rel = "stylesheet" href = "CSS/mainBoard.css">
	</head>
	<body>
		<jsp:include page = "loginComplete.jsp"/>
		<div id = "wrap">
			<ul id = "menu">
				<li><a href="short.jsp">단편모음집</a></li><li><a href="long.jsp">장편연재물</a></li><li><a href="succeed.jsp">연재소설 참가</a></li><li><a href="free.jsp">자유 게시판</a></li><li><a href="post.jsp">베스트 도전</a></li><li><a href="illust.jsp">표지 일러스토 공모</a></li><li><a href="login.jsp">로그인</a></li><li><a href="register.jsp">회원가입</a></li>
			</ul>
			<h1>단편소설 리스트</h1>
			단편소설 리스트 
			<table border="1">
				<tr>
					<th>번호</th><th>제목</th><th>작성자</th><th>날짜</th>
				</tr>
				<c:forEach items="${data}" var = "data">
				<tr>
					<td>${data.getNum()}</td>
					<td><a href = "ReadContent.do?num=${data.getNum()}">${data.getTitle() }</a></td>
					<td>${data.getNickname() }</td>
					<td>${data.getWritingdate() }</td>	
				</tr>
				</c:forEach>
			</table>
		<form action = "ShowShortList.do" method = "get">
			<input type="hidden" name="currentPage" value="1">
			<input type="hidden" name = "number" value = "0">
			<select name = "recordsPerPage">
				<option value = "5">단편 5개</option>
				<option value = "10" selected>단편 10개</option>
				<option value = "15">단편 15개</option>
			</select>
			<input type = "submit" value = "보기">
		</form>	
		<ul id="page">
			<c:forEach begin = "1" end = "${nOfPage}" var = "i">
				<c:choose>
					<c:when test = "${currentPage eq i}">
						<li>${i}(현재)</li>
					</c:when>
				<c:otherwise>
						<li><a href="ShowShortList.do?currentPage=${i}&recordsPerPage=${recordsPerPage}&number=0">${i}</a></li>
				</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
		<div id = "button">
		<ul>
			<li>
				<form method = "post" action = "writeShort.jsp" onclick="needLogin()">
					<input type = "submit" value = "글쓰기">
				</form>
			</li>
			<li>
				<form method = "get" action = "ShowShortList.do" onclick="needLogin()">
					<input type = "submit" value = "삭제">
					<input type = "hidden" value = "1" name = "number">
					<input type = "hidden" value = "${currentPage}" name = "currentPage">
					<input type = "hidden" value = "${recordsPerPage }" name = "recordsPerPage">
				</form>
			</li>
			<li>
				<form method = "get" action = "ShowShortList.do" onclick="needLogin()">
					<input type = "submit" value = "수정">
					<input type = "hidden" value = "2" name = "number">
					<input type = "hidden" value = "${currentPage}" name = "currentPage">
					<input type = "hidden" value = "${recordsPerPage }" name = "recordsPerPage">
				</form>
			</li>	
			<input type = hidden value="${login.getId() }" id="session">
			<input type = hidden value="${id }" id="checkid">
		</ul>
		</div>
		</div>
		<jsp:include page = "goHome.jsp"/>
	</body>
	<script>
		var login = document.getElementById("session").value;
		var id = document.getElementById("checkid").value;
		function needLogin(){
			if(login.length==0){
				location.href="login.jsp";
				alert("로그인해주세요");
			}else if(login.length!=0){
				alert("진행");
			}
		}
	</script>
</html>