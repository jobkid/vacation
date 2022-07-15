<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>테이블 변환하기</title>
	<Style>
		*{
			margin:0px;
			padding:0px;
		}
		#wrap{
			margin:0px auto;
			padding:10px;
			width:1000px;
			background-color:lightgray;
			text-align:center;
		}
		table{
			margin:0px auto;
			width:800px;
			height:800px;
			border: solid black;
		}
		#tsq{
			margin:10px auto;
			width:799px;
			height:799px;
			border:1px solid black;
			
		}
		#ssq{
			margin:0px;
			/**border:1px solid black;**/
			width:800px;
			height:200px;
		}
		#ssq1{
			margin:0px;
			border:1px solid black;
			width:198px;
			height:198px;
			float:right;
		}
		#thsq{
			margin:0px;
			border:1px solid black;
			width:600px;
			height:197px;
		}
		.thsq1{
			margin:0px;
			border:1px solid black;
			width:198px;
			height:198px;
			float:right;
		}
		#fsq{
			margin:0px;
			border:1px solid black;
			width:598px;
			height:396px;
		}
		#fsq1{
			margin:0px;
			width:198px;
			height:198px;
			float:right;
			}
		#fsq2{
			margin:0px;
			width:598px;
			height:200px;
			float:right;
		}
		#fsq3{
			margin:0px;
			border:1px solid black;
			width:198px;
			height:190px;
			float:right;
		}
	</Style>
	</head>
	<body>
		<div id="wrap">
			<h3>아래 부분은 table로 작성되었습니다.</h3>
			<table border='1'>
				<tr>
					<td colspan='3'></td><td></td>
				</tr>
				<tr>
					<td></td><td></td><td></td><td rowspan='3'></td>
				</tr>
				<tr>
					<td rowspan='2' colspan='2'></td><td></td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
			<h3>아래 부분은 div로 작성되었습니다.</h3>
			<div id="tsq">
				<div id="ssq">
					<div id="ssq1">
					</div>
				</div>
				<div>
				<div id="thsq">
					<div class=thsq1></div>
					<div class=thsq1></div>
					<div class=thsq1></div>
				</div>
				</div>
				<div>
					<div id="fsq">
						<div id="fsq1"></div>
						<div id="fsq2">
							<div id="fsq3">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<a href="css5.jsp">다음 단계로 넘어가기</a>
	</body>
</html>