<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "java.util.*" %>
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
			<ul id="menu">
				<li><a href="#" class="update">단편모음집</a></li><li><a href="#" class="update">장편연재물</a></li><li><a href="#" class="update">연재소설 참가</a></li><li><a href="#" class="update">자유 게시판</a></li><li><a href="#" class="update">베스트 도전</a></li><li><a href="notice.do">공지사항</a></li>
			</ul>
			<h1>단편소설 리스트</h1>
			<table border="1">
				<tr>
					<th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>비고</th>
				</tr>
				<c:forEach items="${firstdata }" var = "firstdata"><!-- FirstShortList.java에서 전송한 키값 -->
				<tr>
					<td>${firstdata.getNum() }</td>
					<td><a href = "ReadContent.do?num=${firstdata.getNum()}&currentPage=1&recordsPerPage=5">${firstdata.getTitle() }</a></td>
					<td>${firstdata.getNickname() }</td>
					<td><small>${firstdata.getWritingdate() }</small></td>
					<c:choose>
						<c:when test="${number==1 }">
							<td><a href = "deleteShort.do?num=${firstdata.num}">삭제</a></td>
						</c:when>
						<c:when test="${number==2 }">
							<td><a href = "UpdateShort.do?num=${firstdata.getNum()}">수정</a></td>
						</c:when>	
					</c:choose>	
				</tr><!-- 위의 테이블은 전부 FirstShortList.java에서 전송한 키값과 그에 따른 StoryBean.java에서 불러옴 -->
				</c:forEach>
			</table>
			<jsp:include page="shortlistPerPage.jsp"/>
		<ul id="page">
			<c:forEach begin = "1" end = "${nOfPage}" var = "i"><!-- for문이랑 기능이 값음 1페이지에서 마지막으로 설정한 페이지까지. 즉 FirstShortList.java에서 받아온 키  -->
				<c:choose>
					<c:when test = "${currentPage eq i}">
						<li><a>${i}(현재)</a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test = "${number==0 }">
								<li><a href="FirstShortList.do?currentPage=${i}&recordsPerPage=${recordsPerPage}&number=0&category=${category}&search=${search}">${i},${category},${search}</a></li>
							</c:when>
							<c:when test = "${number==1 }">
								<li><a href="FirstShortList.do?currentPage=${i}&recordsPerPage=${recordsPerPage}&number=1">${i}</a></li>
							</c:when>
							<c:when test = "${number==2 }">
								<li><a href="FirstShortList.do?currentPage=${i}&recordsPerPage=${recordsPerPage}&number=2">${i}</a></li>
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
				<form method = "get" action = "FirstShortList.do">
					<input type = "submit" value="삭제" id="delete" onclick="needLogin()">
					<input type = "hidden" name = "currentPage" value = "1">
					<input type = "hidden" name = "recordsPerPage" value = 10>
					<input type = "hidden" value = "1" name = "number"><!-- number가 1이므로 FirstShortList.do로 들어간다음에 dis = request.getRequestDispatcher("deleteShort.jsp")로 간다. -->
				</form>
			</li>
			<li>	
				<form method = "get" action = "FirstShortList.do">
					<input type = "submit" value = "수정" id="update" onclick="needLogin()">
					<input type = "hidden" name = "currentPage" value = "1">
					<input type = "hidden" name = "recordsPerPage" value = 10>
					<input type = "hidden" value = "2" name = "number">	
				</form>
			</li>	
			<input type = hidden value="${login.getId() }" id="session">
			<input type = hidden value="${id }" id="checkid">
			<h1>${id }</h1>
		</ul>		
		</div>
		</div>
		<jsp:include page = "goHome.jsp"/>		
	</body>
	<script>
		//var	session = document.getElementById("session");
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