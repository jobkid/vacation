<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>태그 추출</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<h1 id="h" style = "color:red;">이 문장은 <span style="color:green;">예시문</span>입니다.</h1>
		<p id="getText">여기를 눌러서 텍스트를 추출</p>
		<p id="getTag">여기를 눌러서 태그를 추출</p>
		<input id = "i" type = "text" value = "이 값은 예시값입니다.">
		<p id = "getValue">여기를 눌러서 인풋값을 추출</p>
		<p id = "getAttr">여기를 눌러서 속성값을 추출</p>
		<script>
			$("#getText").click(function(){
				var text=$("#h").text();	//JQuery 내부에서도 일분 JS문법을 사용할 수 있다.
				alert("태그에 적힌 내요은 ["+text+"]입니다.");
				//.slideUp(), .text()과 같이 만들어지 함수는 jQuery에서만 사용가능
			});
			$("#getTag").click(function(){
				var tag=$("#h").html();
				alert("추출한 태그는 ["+tag+"]입니다.");
			});
			$("#getValue").click(function(){
				var value=$("#i").val();
				alert("추출한 값은 ["+value+"]입니다.");
			});
			$("#getAttr").click(function(){
				var attribute=$("#i").attr("type");
				attribute = $("#h").attr("style");
				alert("추출한 값은 ["+attribute+"]입니다.")
			});
		</script>
	</body>
</html>