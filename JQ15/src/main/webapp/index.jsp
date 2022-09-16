<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>태그 주입 효과</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<h1 id = "h" style = "color : red;"><b>동해물</b>과 <b>백두산</b>이</h1>
		<p id = "setText">여기를 눌러서 [<i>마르고</i> 닯도록] 을 입력</p>
		<p id = "setHTML">여기를 눌러서 [<i>마르고</i> 닯도록] 을 태그로 입력</p>
		<hr>
		<input id="i" value="여기에 값이 입력">
		<p id="setValue">여기를 눌러서 [인풋에 값이 들어갑니다.]를 입력</p>
		<p id="setAttr">여기를 눌러서 속성값을 변경</p>
		<p id="setIndex">인덱스 번호를 확인</p>
		<p id="addHTML">html값을 추가로 입력</p>
		<script>
			$("#setText").click(function(){
				$("#h").text("<i>마르고</i> 닳도록");
			});
			$("#setHTML").click(function(){
				$("#h").text("<i>마르고</i> 닳도록");
			});
			$("#setValue").click(function(){
				$("#i").val("인풋에 값이 들어갑니다.");
				
			});
			$("#setAttr").click(function(){
				$("#i").attr("type", "password");
				$("b").attr("style", "color:green;");
			});
			
			//기존의 값을유지한 채로 추가적인 데이터를 입력
			$("#addText").click(function(){
				$("#h").text(function(i, data){
					return data+" 우리나라 만세";
				});
			});
			$("#setIndex").click(function(){
				$("p").text(function(i, data){
					return data+" 선택된 인덱스 번호 : "+i;
				});
			});
			$("#addHTML").click(function(){
				$("p").html(function(i, data){
					return data+" 선택된 인덱스 <span style ='color:red';>선택된 인덱스는  "+i+"</span>";
				});
			});
		</script>
	</body>
</html>