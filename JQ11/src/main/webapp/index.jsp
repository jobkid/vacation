<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>슬라이드 처리</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<div id = "down" style = "background-color:yellow; width : 300px; height:100px;">
			<h1>슬라이드 다운</h1>
		</div>
		<div id = "SL" style = "background-color:red; width : 300px; height:300px; display:none;">
			출력확인
		</div>
		<div id = "up" style= "background-color:green; width : 300px; height:300px;">
			<h1>슬라이드 업</h1>
		</div>
		<script>
			//슬라이드 다운
			//$(선택자).slideDown();
			//슬라이드 업
			//$(선택자).slideUp();
			$("#down").click(function(){
				$("#SL").slideDown();
			});
			$("#up").click(function(){
				$("#SL").slideUp();
			});
			$(document).ready(function(){
				$("h1").attr("style", "text-align:center; margin:0; line-height:100px");
			});
		</script>
	</body>
</html>