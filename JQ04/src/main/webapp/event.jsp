<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>제이쿼리 이벤트 처리</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	</head>
	<body>
		<p>p태그를 클릭</p>
		<h1>h1태그를 더블클릭</h1>
		<script>
		/*
			function event(){
				alert("p태그가 클릭되었습니다.");
			}
			var p=document.getElementsByTagName("p")[0];
			p.addEventListener("click", event);
			//p.addEventListener("click", function)
			*/
			/*
			$(document).ready(function(){
				$("p").click(function(){
					alert("제이쿼리로 p태그의 이벤트 구현");
				});
			});
			*/
			/*
			addEventListener(String, function(){
				
			}, function(){
				
			}, {
				"이름" : "이영준",
				"나이" : 25,
				"주소" : "서울"
				});*/
			function event2(){
					alert("h1태그가 더블클릭되었습니다.");
				}
			var h1 = document.getElementsByTagName("h1")[0];
			h1.addEventListener("dbclick",event2);
		</script>	
	</body>
</html>