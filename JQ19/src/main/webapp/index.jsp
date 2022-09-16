<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jQuery AJAX</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<div id = "target">
			<h2>이 내용이 변경됩니다.</h2>
		</div>
		<input id="btn" type = "button" value = "외부자료 읽어오기">
		<script>
			$("#btn").click(function(){
				//alert("동작확인!");
				$("#target").load("test.txt h5", function(response, status, xhr){
					console.log("반환값 : "+response);
					console.log("상태값 : "+status);
					console.log("XMLHttpRequest : "+xhr);
				});//이 div 안에 있는 내용.
			});
		</script>
	</body>
</html>