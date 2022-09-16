<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>데이터 삭제</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<ul>
			<li>1번항목</li>
			<li id="lid">2번 항목 id=lid</li>
			<li class = "lclass">3번 항목 class = lclass</li>
			<li>4번 <b>항목</b></li>
			<li class = "lclass">5번 항목 class=lclass</li>
			<li>6번 <i>항목</i></li>
		</ul>
		<p id="del">li 삭제</p>
		<p id="emp">li 비우기</p>
		<p id="del_id">id기준으로 li삭제</p>
		<p id="del_class">class 기준으로 li삭제</p>
		<p id="chain">여러개 삭제</p> 
		<script>
			$("li").attr("style", "border:1px solid red;");
			$("#del").click(function(){
				$("li").remove();
			});
			$("#emp").click(function(){
				$("li").empty();
			});
			$("#del_id").click(function(){
				$("li").remove("#lid");
			});
			$("#del_class").click(function(){
				$("li").remove(".lclass");
			});
			$("#chain").click(function(){
				$("b, i").remove();
			});
		</script>
	</body>
</html>