<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>내 글 확인</title>
		<link rel="stylesheet" href="CSS/mywritingboard.css">
	</head>
	<body>
		<jsp:include page="loginComplete.jsp"/>
		<div id="usermenu">
				마이페이지입니다.<br>
				<a href = "UpdateMember.do?nice=${login.getId().hashCode() }">회원정보 수정하기</a><br>
				<a href = "DeleteMember.do?nice=${login.getNum() }">회원 탈퇴하기</a><br>
				<a href = "MyBoard.do?nice=${login.id }&current=1&record=10&number=${0}&number2=${0}">내 글 확인하기</a>
		</div>
		<h1>내 글 확인</h1>
		<div id = "wrap">
		<table border="1">
			<thead>
				<tr>
					<td>번호</td><td>제목</td><td>작성자</td><td>날짜</td><td>비고</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items = "${myBoard }" var="mywriting">
				<tr>
					<td>${mywriting.num}</td>
					<td><a href="ReadContent.do?num=${mywriting.num}">${mywriting.title }</a></td>
					<td>${mywriting.nickname }</td>
					<td>${mywriting.writingdate }</td>
					<c:choose>
						<c:when test = "${number==login.id.hashCode()}">
							<td><a href="#">삭제</a></td>
						</c:when>
						<c:when test = "${number2==login.id.hashCode()}">
							<td><a href="#">수정</a></td>
						</c:when>
					</c:choose>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<jsp:include page="myboardListPerPage.jsp"/>
		<ul id = "page">
			<c:forEach begin = "1" end = "${nOfPage}" var="i">
				<c:choose>
					<c:when test = "${currentPage eq i }">
						<li>${i}(현재)</li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test = "${number==0&&number2==0 }">
								<li><a href="MyBoard.do?nice=${login.id }&current=${i}&record=${recordsPerPage}&number=0&number2=0">${i }</a></li>
							</c:when>
							<c:when test="${number==login.id.hashCode()}"><!-- 삭제 -->
								<li><a href="MyBoard.do?nice=${login.id }&current=${i}&record=${recordsPerPage}&number=${login.id.hashCode() }&number2=0">${i }</a></li>		
							</c:when>
							<c:when test="${number2==login.id.hashCode()}"><!-- 수정 -->
								<li><a href="MyBoard.do?nice=${login.id }&current=${i}&record=${recordsPerPage}&number=0&number2=${login.id.hashCode()}">${i }</a></li>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
		<div id="button">
		<ul>
			<li>
				<form method = "post" action = "writeShort.jsp">
					<input type = "submit" value = "글쓰기" id="write" onclick="needLogin()">
				</form>
			</li>	
			<li>
				<form method = "get" action = "MyBoard.do">
					<input type = "submit" value="삭제" id="delete" onclick="needLogin()">
					<input type = "hidden" value = "${login.id.hashCode() }" name = "number"><!-- number가 1이므로 FirstShortList.do로 들어간다음에 dis = request.getRequestDispatcher("deleteShort.jsp")로 간다. -->
					<input type = "hidden" value = "0" name="number2">
					<input type = "hidden" value = "1" name= "current">
					<input type = "hidden" value = "10" name = "record">
					<input type = "hidden" value = "${login.id }" name = "nice">
				</form>
			</li>
			<li>	
				<form method = "get" action = "MyBoard.do">
					<input type = "submit" value = "수정" id="update" onclick="needLogin()">
					<input type = "hidden" value = "0" name = "number">
					<input type = "hidden" value = "${login.id.hashCode()}" name = number2>
					<input type = "hidden" value = "1" name= "current">
					<input type = "hidden" value = 10 name = "record">
					<input type = "hidden" value = "${login.id }" name = "nice">
				</form>
			</li>
			<h1>${id }</h1>
		</ul>		
		</div>
		<jsp:include page="goHome.jsp"/>
	</body>
</html>