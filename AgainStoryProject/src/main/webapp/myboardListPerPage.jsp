<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>������ �� ��� ��</title>
		<link rel="stylesheet" href="CSS/memberlistPerPage.css">
	</head>
	<body>
		<form action = "MyBoard.do" method = "get"><!-- ���ñ� ����� �ٲ� �ָ� �����ؾ� �ϱ� ������ ShowShortListServlet.java�� �̵��Ѵ�. �ϴ� ����0920-->
			<select name="category">
				<option value = "title">����</option>
				<option value = "nickname">�ۼ���</option>
				<option value = "content">����</option>
			</select>
			<input type = "text" name="search">
			<input type = "hidden" name = "nice" value = "${login.id}">
			<input type = "hidden" name = "current" value = "1"><!-- ����� form�±׾ȿ� method�� get�̶�� action�� �ּҰ��� �������� hidden�� ������ -->
			<c:choose>
				<c:when test="${number==0&&number2==0 }">
					<input type = "hidden" name="number" value = "0">
					<input type = "hidden" name="number2" value = "0">
				</c:when>
				<c:when test="${number==login.id.hashCode()}">
					<input type = "hidden" name = "number" value = "${login.id.hashCode()}">
					<input type = "hidden" name = "number2" value = "0">
				</c:when>
				<c:when test="${number2==login.id.hashCode()}">
					<input type = "hidden" name = "number" value = "0">
					<input type = "hidden" name = "number2" value = "${login.id.hashCode()}">
				</c:when>
			</c:choose>
			<select name = "record"><!-- ���� �ּҴ� ShowShortList.do?currentPage=��&number=��&recordsPerPage=�� -->
				<option value = "5">���� 5��</option>
				<option value = "10" selected>���� 10��</option>
				<option value = "15">���� 15��</option>
			</select>
			<input type = "submit" value = "����">
		</form>
	</body>
</html>