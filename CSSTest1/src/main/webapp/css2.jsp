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
					<td>�����</td><td>����</td><td>����</td><td>���ǽ�</td>
				</tr>
				<tr class=tr2>
					<td>JAVA</td><td>��, ��, ��</td ><td rowspan='2'>����</td><td rowspan='2'>301</td>
				</tr>
				<tr class=tr2>
					<td>ANDROID</td><td>ȭ, ��</td>
				</tr>
				<tr class=tr2>
					<td rowspan='2'>IOT</td><td>��</td><td rowspan='2'>������</td><td>302</td>
				</tr>
				<tr class=tr2>
					<td>ȭ</td><td>302</td>
				</tr>
				<tr class=tr2>
					<td rowspan='2' colspan='2'>JSP ���� ����</td><td>�̿���</td><td>301</td>
				</tr>
				<tr class=tr2>
					<td>������</td><td>302</td>
				</tr>
			</table>
			<a href="css3.jsp">���� �ܰ�� �Ѿ��</a>
		</div>
	</body>
</html>