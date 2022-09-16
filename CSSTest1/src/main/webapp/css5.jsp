<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>드랍다운 메뉴</title>
		<style>
		*{
			margin:0;
			padding:0;
		}
		.wrap{
			margin:0px auto;
			padding:0px;
			width:500px;
			height:90px;
			background-color:lightgreen;
		}
		.wrap h3{
			text-align:center;
		}
		.menu{
			width:100px;
			padding:10px 0px;
			margin:10px;
			background-color:lightgray;
			text-align:center;
			border:1px solid black;
		}
		.menu:hover{
			background-color:green;
			color:white;
			clear:both;
		}
		.menu:hover a{
			display:block;
		}
		.down a{
			height:20px;
			width:76px;
			border:1px solid white;
			text-decoration:none;
			padding:10px;
			display:none;
		}
		.down a:hover{
			background-color:black;
			color:white;
		}
		.down a:active{
			background-color:red;
			color:white;
			
		}
		.main>.down>a:hover{
			display:block;
			background-color:black;
		}
		</style>
	</head>
	<body>
		<div class="wrap">
			<h3>각 메뉴는 a태그로 이루어져 있습니다.</h3>
				<div class="menu">
				메뉴
					<div class="down">
						<a href="#">하부메뉴1</a>
						<a href="#">하부메뉴2</a>
						<a href="#">하부메뉴2</a>
					</div>
				</div>
		</div>
		<a href="css6.jsp">다음 단계로 넘어가기</a>
	</body>
</html>