<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>제이쿼리 애니메이션 정지</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<h1>정지처리</h1>
		<input type = "button" id="start" value = "시작">
		<input type = "button" id="stop" value = "정지">
		<div style = "width:300px; height:300px; background-color:blue; display:none;"></div>
		<hr>
		<p>연속동작 실행</p>
		<h1 id="slideup" style = "background-color:red;">이 부분은 슬라이드 업 되는 부분입니다.</h1>
		<h1 id="slidedown" style = "display:none; background-color:blue">이 부분은 슬라이드 다운되는 부분입니다.</h1>
		<h1 id="chain" style = "background-color:green;">연속 동작이 이루어지는 부분입니다.</h1>
		<script>
			$(document).ready(function(){
				$("#start").click(function(){
					$("div").slideToggle(5000);
				});
				$("#stop").click(function(){
					$("div").stop();
				});
				$("p").click(function(){
					$("#slideup").slideUp(3000);
					$("#slidedown").slideDown(3000);
					$("chain").slideUp(3000).slideDown(3000);
				});
			});
		</script>
	</body>
</html>