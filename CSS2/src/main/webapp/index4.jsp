<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>사각배열</title>
		<style>
			*{
				text-align:center;
			}
		
			#tab{
				border:1px solid black;
				background-color:lightblue;
				padding:15px;
			}
			table{
				border-spacing:0px;
			}
			td{
				border:1px solid black;
			}
			#total{
				border:1px solid black;
				background-color:lightyellow;
				padding:15px;
			}
			#s1{
				width:107px;
				height:100px;
				border:1px solid black;
			}
			
			#total > div > div{

				width:105px;
				height:49px;
				border:1px solid black;				
			}
			.s3{
				border:1px solid black;
				width: 49px;
				height: 49px;
				float:left
			}
		</style>
	</head>
	<body>
		<div id=tab>
			<table>
				<tr>
					<td colspan="2">사각</td>
				</tr>
				<tr>
					<td>나</td><td>열</td>
				</tr>
			</table>
		</div>
		<div id="total">
			<div id="s1">
				<div id="s2">사각</div>
				<div>
					<div class="s3">배</div>
					<div class="s3">열</div>
				</div>
			</div>
		</div>	
	</body>
</html>