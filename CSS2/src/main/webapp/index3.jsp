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
				background-color:lightblue;
				padding:15px;
			}
			table{
				border-spacing:0;
			}
			td{
				border:1px solid black;
			}
			#div{
				background-color:lightyellow;
				padding:15px;
			}
			div{
				border:1px solid black;
			}
			#div > div > div{
				width:50px;
				height:50px;
				line-height:50px;
				float:left;
				
			}
			#div > div{
				width:110px;
				border:0px;
			}
				#div > div:after{
				content:"";
				display:block;
				clear:both;
			}
		
		</style>
	</head>
	<body>
		<div id=tab>
			<table>
				<tr>
					<td>사</td><td>각</td>
				</tr>
				<tr>
					<td>배</td><td>열</td>
				</tr>
			</table>
		</div>
		<div id="div">
			<div class="line">
				<div>사</div>
				<div>각</div>
			</div>
			<div class="line">
				<div>배</div>
				<div>열</div>
			</div>
		</div>
		<a href="index4.jsp">다음 페이지로 넘어가기</a>
	</body>
</html>