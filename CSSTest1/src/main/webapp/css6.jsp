<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>페이지 레이아웃</title>
		<style>
		*{
			margin:0px;
			padding:0px;
		}
		.wrap{
			margin: 0px auto;
			width:1500px;
			background-color:orange;
		}
		#red{
			margin: 0px auto;
			background-color:red;
			width:1200px;
			height:500px;
		}
		#red2{
			margin:0px auto;
			padding:0;
			float:left;
		}
		
		#main{
			margin: 0 auto;
			border:1px solid black;
			width:1200px;
			height:500px;
			
		}
		#logo{
			background-color:black;
			color:white;
			text-align:center;
			width:200px;
			height:200px;
			border:1px solid black;
			
		}
		#title{
			width:200px;
			height:200px;
			text-align:center;
			border:1px solid black;
			
		}
		#login{
			width:200px;
			height:200px;
			text-align:center;
			border:1px solid black;
		}
		#side{
			width:200px;
			height:498px;
			background-color:green;
		}
		#main2{
			margin:-380px auto;
			width:300px;
			height:300px;
			background-color:blue;
		}
		</style>
	</head>
	<body>
		<div class="wrap">
			<header id="red">
				<div id="red2">
					<div class="inlineblock" id="logo">로고자리</div>
					<div class="inlineblock" id="title">제목자리</div>
					<div class="inlineblock" id=login>아이디 :<input name="id"><br>
						비밀번호 : <input name="pwd"></div>
				</div>
			</header>
			
			<footer id="main">
				<div id="side"></div>
				<div id="main2"></div>
			</footer>
		</div>
	</body>
</html>