<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>AgainStory</title>
		<link rel="stylesheet" href = "CSS/index.css">
		</head>
	<body>
		<jsp:include page = "loginComplete.jsp"/>
		<div id="wrap">
			<div id="again">
				<a href="FirstShortList.do?number=0&recordsPerPage=10&currentPage=1"><p>Again</p></a><!-- 미리  서블릿을 주지 말 것. -->
			</div>									<!-- 메인에서 controller 패키지의 FirstShortList.java 파일로 간다. 즉 FirstShort.do 서블렛으로 간다. -->							
			<div id="story">
				<a href = "longList" onclick=#><p>Story</p></a>
			</div>
		</div>
		<script>
		/*
			var top = document.getElementById("again");
			top.addEventListener("mouseover", function(){
				top.style.backgroundColor="white";
				top.style.color="black";
			});
			top.addEventListener("mouseout", function() {
				top.style.backgroundColor="";
				top.style.color="";
			});
			*/
		</script>
	</body>
</html>