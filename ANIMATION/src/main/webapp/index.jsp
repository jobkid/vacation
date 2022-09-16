<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>애니메이션 효과 주기</title>
		<link rel="stylesheet" href="test.css">
	</head>
	<body>
		<div id="change">
			<img class="img1" src = "kid.jpg">
			<img class="img2" src = "trapalga.jpg">
		</div>
		<hr>
		<div id = "ani">
			<div id="box1"></div>
			<div id="box2"></div>
		</div>
		<hr>
		<div class="speed" id="linear">
			linear
		</div>
		<div class="speed" id="ease">
			ease
		</div>
		
		<div class="speed" id="easeIn">
			ease-in
		</div>
		<div class="speed" id="easeOut">
			ease-out
		</div>
		<div class="speed" id="easeInOut">
			ease-in-out
		</div>
		<hr>
		<div id = "ani2">
			<div id="box3"></div>
		</div>
	</body>
</html>