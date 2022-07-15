<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>분할 연습</title>
	<style>
		*{
			text-align:center;
		}
		#tab{
			background-color:lightblue;
			padding:15px;
			width:1200px;
			border:1px solid black;
			margin:0px auto;
		}
		table{
			border-spacing:0;
		}
		td{
			width:50px;
			height:50px;
			border:1px solid black;
			padding:0px;
		}
		#div{
			background-color:lightyellow;
			padding:15px;
			width:1200px;
			border:1px solid black;
			margin:0px auto;
		}
		#div div{
			border:1px solid black;
			width:50px;
			height:50px;
			line-height:50px;
			float:left;
			/*
			마진을 제거하는 것이 곧 가로로 나열하는 것이다. 면적이 있어야 마진이 있다. 인라인 블록은 애초부터 가로로 나열하기 위해
			*/
		}
		#div:after{
			content:"";
			display:block;
			clear:both;
			/*해당 div가 끝나기 직전에 무언가 글자를 넣으라는 의미 이것이 after*/
		}
	</style>
	</head>
	<body>
		<div id="tab">
			<table>
					<tr>
						<td>가</td><td>로</td><td>나</td><td>열</td>
					</tr>
			</table>
		</div>
		<div id="div">
			<div>가</div>
			<div>로</div>
			<div>나</div>
			<div>열</div>
		</div>
		<a href="index3.jsp">다음 페이지로 넘어가기</a>
	</body>
</html>