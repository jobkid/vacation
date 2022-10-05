<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>상품목록 페이지</title>
		<link rel="stylesheet" href = "style.css">
	</head>
	<body>
		<div id="wrap">
		<h1>상품 리스트</h1>
			<table>
				<tr>
					<td colspan="5">상품 목록</td>
				</tr>
				<tr>
					<td colspan="5" style = "text-align:right;">
						<a href="ProductWrite">상품등록</a>
					</td>
				</tr>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>가격</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<c:forEach items = "${productlist}" var="product">
					<tr>
						<td>${product.getCode() }</td>
						<td>${product.getName() }</td>
						<td>${product.getPrice() }원</td>
						<td><a href = "ProductUpdate?code=${product.getCode()}">수정</a></td>
						<td><a href = "ProductDelete?code=${product.getCode()}">삭제</a></td>
					</tr>
				</c:forEach>	
			</table>
		</div>
	</body>
</html>