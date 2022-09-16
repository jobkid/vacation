<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>제이쿼리 이벤트 처리</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<p>p태그를 클릭</p>
		<h1>h1태그를 더블클릭</h1>
		<input placeholder = "마우스를 이동">
		<h2>마우스를 밖으로 이동</h2>
		<ul>
			<li>목록1</li>
			<li>목록2</li>
			<li>목록3</li>
			<li>목록4</li>
		</ul>
		<script>

			/*
			function event(){
				alert("p태그가 클릭되었습니다.");
			}
			var p=document.getElementsByTagName("p")[0];
			p.addEventListener("click", event);
			
			var p =document.getElementsByTagName("p")[0];
			p.addEventListener("click", function(){
				alert("p태그가 클릭되었습니다.")
			});
			
			
			var h1 = document.getElementsByTagName("h1")[0];
			h1.addEventListener("dblclick", function(){
				alert("h1태그가 더블클릭되었습니다.");
			});
			*/
			/*
			var input =document.getElementsByTagName("input")[0];
			input.addEventListener("mouseenter", function(){
				alert("마우스가 input 내부로 들어왔습니다.");
			});
			*/
			
			$(document).ready(function(){
				$("p").click(function(){
					alert("p태그가 클릭되었습니다.");
				});
				$("h1").dblclick(function(){
					alert("h1태그가 더블클릭되었습니다.");
				});
				$("input").mouseenter(function(){
					alert("input내부로 마우스가 들어왔습니다.");
				});
				$("h2").mouseleave(function(){
					alert("h2외부로 마우스가 빠져 나갔습니다.");
				});
				//호버처리는 기능이 두 개 들어감에 주의
				$("li").hover(function(){
					$(this).attr("style","background-color:black; color:white;");
				}, function(){
					$(this).attr("style", "");
				});
				//on()의 사용
				$("li").on("click", function(){
					alert("메뉴가 클릭되었습니다.")
				});
			});
			
		</script>
	</body>
</html>