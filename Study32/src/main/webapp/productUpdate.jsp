<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>상품 관리</title>
		<link rel = "stylesheet" href = "style.css">
	</head>
	<body>
		<div id = "wrap">
			<h1>상품 수정</h1>
			<form method = "post" enctype = "multipart/form-data" name = "frm" action = "ProductUpdate">
				<input type = "hidden" name = "code" value = "${product.getCode() }"><!-- 사용자가 건들지 못하도록 -->
				<input type = "hidden" name = "nomakeImg" value = "${product.getPictureurl() }">
				<table>
					<tr><!-- for문써서 데이터 정제위해 태그립 가져 온다. -->
						<td>
						<c:choose>
							<c:when test = "${product.getPictureurl()=='/files/null' }">
							
							</c:when>
							<c:otherwise>
								<img src = ".${product.getPictureurl() }"
>							</c:otherwise>
						</c:choose>
						</td>
						<td>
							<table>
								<tr>
									<th>상품명</th>
									<td><input type = "text" name = "name" value="${product.getName() }"></td>
								</tr>
								<tr>
									<th>가격</th>
									<td><input type = "text" name = "price" value = "${product.getPrice() }"></td>
								</tr>
								<tr>
									<th>사진</th>
									<td>
										<input type = "file" name = "pictureurl"><br>
										(이미지를 변경하시려면 파일을 선택해주세요.)
									</td>
								</tr>
								<tr>
									<th>설명</th>
									<td>
										<textarea rows = "10" cols="90" name = "description">${product.getDescription()}
										</textarea>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<input type = "submit" value = "수정하기" onclick = "return check()">
				<input type = "reset" value = "다시 작성">
				<input type = "button" value = "목록보기" onclick = "location.href='ProductList'">
			</form>
		</div>
		<script>
			function check(){
				if(document.frm.name.value.length==0){
					alert("상품명을 써주세요.");
					frm.name.focus();
					return false;
				}
				if(document.frm.price.value.length==0){
					alert("가격을 입렵해주세요.");
					frm.name.focus();
					return false;
				}
				if(isNaN(document.frm.price.value)){
					alert("가격은 숫자로 입력하셔야 합니다.");
					frm.price.focus();
					return false;
				}
				return true;
			}
		</script>
	</body>
</html>