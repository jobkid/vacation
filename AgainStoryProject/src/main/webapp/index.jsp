<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>AgainStory</title>
	<style>
		*{
			margin : 0;
			padding : 0;
		}
		#wrap{
			margin : 0 auto;
		}
		#again{
			height : 50%;
			background-color : black;
			color : white;
			font-size : 500%;
			line-height: 468.5px;
			font-size : 100pt;
		}
		#story{
			height : 468.5px;
			backgrount-color:white;
			color : black;
			text-align : center;
			font-size : 500%;
			line-height: 468.5px;
		}
		a{
			margin : 0px 0px 0px 10$;
			font-size : 10pt;
			text-align : left;
			text-align: center;
		}
		h1{
			color : white;
		}
	</style>
	</head>
	<body>
		<h1>안녕하세요.^^0916</h1>
		<div id="wrap">
			<div id="again">
				<a href="FirstShortList.do" style = "font-size : 50pt"><input type = "hidden" value = "10" name = "recordsPerPage"><p>Again</p></a><!-- 미리  서블릿을 주지 말 것. -->
			</div>
			<div><a href = "#" id="login">로그인</a></div>
			<div><a href = "register.jsp">회원가입</a></div>
			<div id="story">
				<a href = "longList" style = "font-size : 50pt"><p>Story</p></a>
			</div>
		</div>
		<script>
			var top = document.getElementById("again");
			top.addEventListener("mouseover", function(){
				top.style.backgroundColor="white";
				top.style.color="black";
			});
			top.addEventListener("mouseout", function() {
				top.style.backgroundColor="";
				top.style.color="";
			});
		</script>
	</body>
</html>