<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>세로 나열</title>
		<style>
		*{
			text-align:center;
			
		}
		#wrap{
			background-color:lightblue;
			padding:15px;
			border:1px solid black;
			width:1200px;
			margin:0 auto;
		}
		table{
			border-spacing:0;
		}
		td{
			width:50px;
			height:50px;
			border:1px solid black;
		}
		#wrap2{
			background-color:lightyellow;
			padding:15px;
			border:1px solid black;
			width:1200px;
			margin:0 auto;
		}
		#wrap2 div{
			border:1px solid black;
			width:50px;
			heigt:50px;
			line-height:50px;
			
			/*
			마진을 제거하는 것이 곧 가로로 나열하는 것이다.
			*/
		}
		</style>
	</head>
	<body>
		<div id="wrap">
			<table>
				<tr><td>세</td></tr>
				<tr><td>로</td></tr>
				<tr><td>나</td></tr>
				<tr><td>열</td></tr>
			</table>
		</div>	
		<div id="wrap2">
				<div>세</div>
				<div>로</div>
				<div>나</div>
				<div>열</div>	
		</div>
		<a href="index2.jsp">다음 페이지로</a>
	</body>
</html>