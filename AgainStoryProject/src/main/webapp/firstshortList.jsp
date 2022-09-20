<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>단편소설</title>
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
		<div id = "wrap">
			단편소설 리스트 
			<table border="1">
				<tr>
					<th>번호</th><th>제목</th><th>작성자</th><th>날짜</th>
				</tr>
				<c:forEach items="${firstdata }" var = "firstdata"><!-- FirstShortList.java에서 전송한 키값 -->
				<tr>
					<td>${firstdata.getNum() }</td>
					<td><a href = "ReadContent.do?num=${firstdata.getNum()}">${firstdata.getTitle() }</a></td>
					<td>${firstdata.getNickname() }</td>
					<td>${firstdata.getWritingdate() }</td>	
				</tr><!-- 위의 테이블은 전부 FirstShortList.java에서 전송한 키값과 그에 따른 StoryBean.java에서 불러옴 -->
				</c:forEach>
			</table>
		<form action = "ShowShortList.do" method = "get"><!-- 개시글 목록을 바꿔 주면 갱신해야 하기 때문에 ShowShortListServlet.java로 이동한다. 일단 수정0920-->
			<input type="hidden" name = "currentPage" value = "1"><!-- 참고로 form태그안에 method가 get이라면 action에 주소값을 적지말고 hidden을 만들자 -->
			<input type="hidden" name = "number" value = "0"><!-- 결론적으로 ShowShortList.do에 보내줄 파라미터(매개변수)은 currentPage, number, recordPerPage-->
			<select name = "recordsPerPage"><!-- 따라서 주소는 ShowShortList.do?currentPage=값&number=값&recordsPerPage=값 -->
				<option value = "5">단편 5개</option>
				<option value = "10" selected>단편 10개</option>
				<option value = "15">단편 15개</option>
			</select>
			<input type = "submit" value = "보기">
		</form>	
		<ul>
			<c:forEach begin = "1" end = "${nOfPage}" var = "i"><!-- for문이랑 기능이 값음 1페이지에서 마지막으로 설정한 페이지까지. 즉 FirstShortList.java에서 받아온 키  -->
				<c:choose>
					<c:when test = "${currentPage eq i}">
						<li><a>${i}(현재)</a></li>
					</c:when>
				<c:otherwise>
						<li><a href="ShowShortList.do?currentPage=${i}&recordsPerPage=${recordsPerPage}&number=0"><input type = "hidden" name = "number" value = "0">${i}</a></li>
				</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
		<form method = "post" action = "writeShort.jsp">
			<input type = "submit" value = "글쓰기">
		</form>
		<form method = "get" action = "FirstShortList.do?number">
			<input type = "submit" value="삭제">
			<input type = "hidden" value = "1" name = "number"><!-- number가 1이므로 FirstShortList.do로 들어간다음에 dis = request.getRequestDispatcher("deleteShort.jsp")로 간다. -->
		</form>
		<form method = "get" action = "FirstShortList.do?number">
			<input type = "submit" value = "수정">
			<input type = "hidden" value = "2" name = "number">	
		</form>
		</div>
	</body>
</html>