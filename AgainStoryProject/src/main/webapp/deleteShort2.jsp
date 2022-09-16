<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
		<title>���� â</title>
		<style>
			*{
				margin : 0 auto;
				padding : 0;
				text-align : center;
			}
			ul li{
				display : inline-block;
			}
		</style>
	</head>
	<body>
		<div id = "wrap">
			���� ����Ҽ� ����Ʈ 22
			<table border="1">
				<tr>
					<th>��ȣ</th><th>����</th><th>�ۼ���</th><th>��¥</th><th>����</th>
				</tr>
				<c:forEach items="${data}" var = "data">
				<tr>
					<td>${data.getNum()}</td>
					<td><a href = "ReadContent.do?num=${data.getNum()}">${data.getTitle() }</a></td>
					<td>${data.getNickname() }</td>
					<td>${data.getWritingdate() }</td>
					<td><a href = "deleteShort.do?num=${data.getNum()}">����</a></td>	
				</tr>
				</c:forEach>
			</table>
		<form action = "ShowShortList.do" method = "get">
			<input type = "hidden" name = "currentPage" value="1">
			<input type = "hidden" name = "number" value = "1">
			<select name = "recordsPerPage">
				<option value = "5">���� 5��</option>
				<option value = "10" selected>���� 10��</option>
				<option value = "15">���� 15��</option>
			</select>
			<input type = "submit" value = "����">
		</form>	
		<ul>
			<c:forEach begin = "1" end = "${nOfPage}" var = "i">
				<c:choose>
					<c:when test = "${currentPage eq i}">
						<li><a>${i}(����)</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="ShowShortList.do?currentPage=${i}&recordsPerPage=${recordsPerPage}&number=1">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
		<form method = "post" action = "writeShort.jsp">
			<input type = "submit" value = "�۾���">
		</form>
		<form method = "get" action = "ShowShortList.do">
			<input type = "hidden" value = "1" name = "number">
			<input type = "hidden" value = "${currentPage}" name = "currentPage">
			<input type = "hidden" value = "${recordsPerPage }" name = "recordsPerPage">
			<input type = "submit" value="����">
		</form>
			<form method = "get" action = "ShowShortList.do">
			<input type = "hidden" value = "2" name = "number">
			<input type = "hidden" value = "${currentPage }" name = "currentPage">
			<input type = "hidden" value = "${recordsPerPage }" name = "recordsPerPage">
			<input type = "submit" value = "����">
		</form>
		</div>
	</body>
</html>