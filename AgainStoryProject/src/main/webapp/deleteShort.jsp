<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
		<head>
		<meta charset="utf-8">
		<title>삭제 창</title>
		<style>
			*{
				margin : 0 auto;
				padding : 0;
				text-align : center;
			}
			ul li{
				display : inline-block;
			}
		</style>
	</head>
	<body>
		<jsp:include page = "loginComplete.jsp"/>
		<div id = "wrap">
			삭제 단편소설 리스트 
			<table border="1">
				<tr><!-- 이 페이지는 firstshortList.jsp페이지 중 테이블에서 삭제 컬럼만 추가한 것으로 보면됩니다. FirstShortList.java에서 'if'문을 참고하세요  -->
					<th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>삭제</th>
				</tr>
				<c:forEach items="${firstdata }" var = "firstdata"><!-- FirstShortList.java에서 받아온 키값-->
					<tr>
						<td>${firstdata.getNum() }</td>
						<td><a href = "ReadContent.do?num=${firstdata.getNum()}">${firstdata.getTitle() }</a></td>
						<td>${firstdata.getNickname() }</td>
						<td>${firstdata.getWritingdate() }</td>
						<td><a href = "deleteShort.do?num=${firstdata.getNum()}">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		<form action = "ShowShortList.do" method = "get">
			<input type="hidden" name="currentPage" value="1">
			<select name = "recordsPerPage">
				<option value = "5">단편 5개</option>
				<option value = "10" selected>단편 10개</option>
				<option value = "15">단편 15개</option>
			</select>
			<input type = "submit" value = "보기">
		</form>	
		<ul>
			<c:forEach begin = "1" end = "${nOfPage}" var = "i">
				<c:choose>
					<c:when test = "${currentPage eq i}">
						<li><a>${i}(현재)</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="ShowShortList.do?currentPage=${i}&recordsPerPage=${recordsPerPage}&number=1">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
		<form method = "post" action = "writeShort.jsp">
			<input type = "submit" value = "글쓰기">
		</form>
		<form method = "get" action = "deleteShort.do">
			<input type = "submit" value="삭제"><!-- 실제로 삭제됨. -->
		</form>
		<form method = "get" action = "ShowShortList.do">
			<input type = "hidden" value = "2" name = "number">
			<input type = "hidden" value = "${currentPage }" name = "currentPage">
			<input type = "hidden" value = "${recordsPerPage }" name = "recordsPerPage">
			<input type = "submit" value = "수정">
		</form>
		</div>
		<jsp:include page = "goHome.jsp"/>
	</body>
</html>