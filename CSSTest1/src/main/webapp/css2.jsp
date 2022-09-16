<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>CSS</title>
		<style>
			*{
				margin:0px;
				padding:0px;
			}
			#wrap{
				background-color:green;
				margin:0 auto;
				padding:10px;
				width:400px;
			}
			#wrap2{
				border:1px;
				margin:40px auto;
				background-color:white;
				text-align:center;
				border: 2px solid black;
			}
			.tr td{
				background-color:blue;
				color:white;
				text-align:center;
			}
			.tr2{
				background-color:yellow;
			}
			
		</style>
	</head>
	<body>
		<div id="wrap">
			<table border='1' id=wrap2>
				<tr class=tr>
					<td>과목명</td><td>요일</td><td>교수</td><td>강의실</td>
				</tr>
				<tr class=tr2>
					<td>JAVA</td><td>월, 수, 금</td ><td rowspan='2'>고희선</td><td rowspan='2'>301</td>
				</tr>
				<tr class=tr2>
					<td>ANDROID</td><td>화, 목</td>
				</tr>
				<tr class=tr2>
					<td rowspan='2'>IOT</td><td>월</td><td rowspan='2'>이진선</td><td>302</td>
				</tr>
				<tr class=tr2>
					<td>화</td><td>302</td>
				</tr>
				<tr class=tr2>
					<td rowspan='2' colspan='2'>JSP 전일 수업</td><td>이영준</td><td>301</td>
				</tr>
				<tr class=tr2>
					<td>이진선</td><td>302</td>
				</tr>
			</table>
			<a href="css3.jsp">다음 단계로 넘어가기</a>
		</div>
	</body>
</html>