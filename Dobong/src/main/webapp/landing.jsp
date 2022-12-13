<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Beans.MemberDTO"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>리뷰확인</title>
		<style type="text/css">
			td{
				border: 1px solid #ccc;
			}	
			.img{
				width:50%;
				height:50%;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
		<% 	
			MemberDTO m=null;
			if(session.getAttribute("loginUser")!=null){
				m=(MemberDTO)session.getAttribute("loginUser");
			}
		%>
			<a href="NoticeServlet">공지사항</a> <br>
			<!-- <a href="detailServlet">상세페이지</a> <br> -->
			<a href="MainServlet">대분류</a><br>
			
			<a href="noticeWrite.jsp">글쓰기</a><br>
		<%
			if(m==null){
		%>
				<a href="login.jsp">로그인</a><br>
				<a href="join.jsp">회원가입</a><br>
		<%		
			}
		%>
			
		<%
			if(m!=null){
		%>
				<a href="LogoutServlet">로그아웃</a><br>
		<%
				if(m.getAdmin()==1){
		%>
				<a href="adminPage.jsp">관리자 페이지</a>
		<%		
				}
			}
		%>	
			<div class="container" var="1" max="3">
				<div class="slides">
				<c:forEach items="${imglist }" var="imglist">
					<div class="img">
						<img src="${imglist.imageurl }" alt="noImage">
					</div>	
				</c:forEach>
				</div>
			</div>
		</div>
		<button class = "button1">버튼1</button>
		<button class = "button2">버튼2</button>
		<button class = "button3">버튼3</button>	
		<script>
		 const container = document.querySelector('.container'),
		    slides = document.querySelectorAll('img'),
		    slidecounter = slides.length;
		let currentIndex = 0;


		var lele = 0;
		var i = 0;
		function moveleft() {
		    if (i < slidecounter - 1) {
		        lele += 100;
		        i++;
		        container.style.transition = '.3s'
		        setTimeout('moveleft()', 3000);
		    } else {
		        container.style.transition = '0s'
		        lele = 0;
		        i = 0;
		        setTimeout('moveleft()', 0);
		    }

		    container.style.left = "-" + lele + "%";
		    
		}

		moveleft();
		</script>
	</body>
</html>