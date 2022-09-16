<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jQuery CSS 속성처리</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<style>
			.red{
				background-color:red;
			}
		</style>
	</head>
	<body>
		<h1>CSS값이 변동하는 것을 확인</h1>
		<input type = "button" id = "btn_add" value = "클래스 주입">
		<input type = "button" id = "btn_del" value = "클래스 제거">
		<input type = "button" id = "btn_tog" value = "클래스 토글"><br>
		<input type = "button" id = "btn_border" value = "보더입력">
		<input type = "button" id = "btn_color" value = "색상주입">
		<input type = "button" id = "btn_chain" value = "동시 스타일 변경">
		<script>
			$("#btn_add").click(function(){
				$("h1").addClass("red");
			});
			$("#btn_del").click(function(){
				$("h1").removeClass("red");
			});
			$("#btn_tog").click(function(){
				$("h1").toggleClass("red");
			});
			$("#btn_border").click(function(){
				$("h1").css("border", "1px solid black");
			});
			$("#btn_color").click(function(){ //인라인 태그에 들어감
				$("h1").css("color", "blue");
			});
			$("#btn_chain").click(function(){
				$("h1").css({
					"color" : "white",
					"background-color" : "black",
					"border":"5px solid red"
					});
			});
		</script>
	</body>
</html>