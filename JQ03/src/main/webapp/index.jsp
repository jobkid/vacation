<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jQuery 선택자</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	</head>
	<body>
		<p><b style="color:red">동해물과</b> <b>백두산</b>이 마르고 닳도록</p>
		<p><i id="green">하느님이</i> 보우하사 <i id="blue">우리나라</i> 만세</p>
		<p><ins class="in">무궁화</ins> <ins class="in">삼천리</ins> <ins class="in">화려강산</ins></p>
		<p>대한사람 대한으로 길이 보전하세</p>
		<script>//"b태그 안에 있는 텍스트는 ㅠ에 영향을 받음."
			/*
			document.getElementsByTagName("b")[0].setAttribute("style", "color:red;");
			document.getElementsByTagName("b")[1].setAttribute("style", "color:orange;");
			document.getElementById("green").setAttribute("style", "color:green;");
			document.getElementById("blue").setAttribute("style", "color:blue;");
			var ins=document.getElementsByClassName("in");
			console.log(ins);
			for(var i=0; i<ins.length; i++){
				ins[i].setAttribute("style", "color:orange;");
				
			}
			*/
			$(document).ready(function(){
				$("b").attr("style", "color:red;");
				$("#green").attr("style", "color:green;");
				$("#blue").attr("style", "color:blue");
				$(".in").attr("style", "color:orange");
			});
			//document.getElementById("b").attr("style", "color:white;"); 절대 섞어쓰지 마세요.
		</script>
	</body>
</html>