<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>가로 나열하기</title>
		<style>
			*{
				margin:0;
				padding:0px;
			}
			#wrap{
				margin:0px auto;
				width:1000px;
				background-color:lightgray;
			}
			#wrap2{
				margin:0px auto;
				width:900px;
				text-align:center;
			}
			
			table{
				margin:0px auto;
				border: 1px solid white;
				padding:2px;
				
			}
			table tr #red{
				background-color:red;
				width:100px;
				height:100px;
			}
			table tr #blue{
				background-color:blue;
				width:100px;
				height:100px;
			}
			table tr #green{
				background-color:green;
				width:100px;
				height:100px;
			}
			table tr #black{
				background-color:black;
				width:100px;
				height:100px;
			}
			#wrap3{
				margin:0px auto;
				width:900px;
				text-align:center;
			}
			ul{
				list-style:none;
				border: 1px solid white;
				padding:4px;
				display:inline-block;
			}
			ul li{
				border: 1px solid white;
			}
			ul #red{
				background-color:red;
				width:200px;
				height:200px;
				display:inline-block;
			}
			ul #blue{
				background-color:blue;
				width:200px;
				height:200px;
				display:inline-block;
			}
			ul #green{
				background-color:green;
				width:200px;
				height:200px;
				display:inline-block;
			}
			ul #black{
				background-color:black;
				width:200px;
				height:200px;
				display:inline-block;
			}
			#wrap4{
				margin:0 auto;
				width:900px;
				text-align:center;
			}
			#wrap4:after{
				content:" ";
				display:block;
				clear:both;
				height:10px;
			}
			#wrap4 #red{
				background-color:red;
				width:200px;
				height:200px;
				float:left;
				padding:2px;
			}
			#wrap4 #blue{
				background-color:blue;
				width:200px;
				height:200px;
				float:left;
				padding:2px;
			}
			#wrap4 #green{
				background-color:green;
				width:200px;
				height:200px;
				float:left;
				padding:2px;
			}
			#wrap4 #black{
				background-color:black;
				width:200px;
				height:200px;
				float:left;
				padding:2px;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<div id="wrap2">
				<h3>아래 부분은 table을 이용하여 나열된 div입니다.</h3>
				<table>
					<tr>
						<td id="red"></td><td id="blue"></td><td id="green"></td><td id="black"></td>
					</tr>
				</table>
			</div>
			<div id="wrap3">
				<h3>아래 부분은 inline-block으로 나열된 div입니다.</h3>
				<ul>
					<li id="red"></li><li id="blue"></li><li id="green"></li><li id="black"></li>
				</ul>
			</div>
			<div id="wrap4">
				<h3>아래 부분은 float으로 나열된 div입니다.</h3>
				<div id="red"></div><div id="blue"></div><div id="green"></div><div id="black"></div>
			</div>
			<div id="wrap5">
			</div>
		</div>
		<a href="css4.jsp">다음 단계로 넘어가기</a>
	</body>
</html>