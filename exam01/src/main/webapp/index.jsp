<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>제이쿼리 실습</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<style>
			*{
				padding : 0;
			}
			#wrap{
				margin : 0 auto;
				width : 800px;
				border : 10px solid green;
			}
			#blue{
				height : 200px;
				background-color : blue; 
			}
			#red{
				height : 200px;
				background-color : red;
			}
			ul{
				padding : 0;
				margin : 0;
				/*display : inline-block;*/
			}
			ul .yellow{
				background-color : yellow;
				width : 200px;
				height : 100px;
				display : inline-block;
			}
			ul .black{
				background-color : black;
				width : 200px;
				height : 100px;
				display : inline-block;
			}
		</style>
	</head>
	<body>
	<div id = "wrap">
		<div id="blue" style = "display : none;"></div>
		<ul id="yb">
			<li class = "yellow"></li><li class = "black"></li><li class="yellow"></li><li class = "black"></li>	
		</ul>
		<div id="red" style = "display : none;"></div>
	</div>
	<script>
		/*
		$(".yellow").click(function(){
			$("#blue").slideDown();
		});
		$(".yellow").click(function(){
			$("#blue").slideUp();
		});
		$(".black").click(function(){
			$("#red").slideUp();
		});
		$(".black").click(function(){
			$("#red").slideDown();
		});*/
		
		
		$(".yellow").click(function(){
			$("#blue").slideToggle();
		});
		$(".black").click(function(){
			$("#red").slideToggle();
		});
	</script>
	</body>
</html>