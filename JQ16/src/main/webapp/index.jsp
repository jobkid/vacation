<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>데이터 추가 효과</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
	<!-- 
		before
		<h1>
		append
		
		prepend
		</h1>
		after
	 -->
		<h1 id = "iot">IOT프로그래밍 학과입니다.</h1>
		<p id = "app">눌러서 뒤에 데이터를 추가</p>
		<p id = "pre">눌러서 앞에 데이터를 추가</p>
		<p id = "addTag">눌러서 새로운 태그를 생성</p>
		<hr>
		<p id = "next">눌러서 태그를 뒤에 추가</p>
		<p id = "befo">눌러서 태그를 앞에 추가</p>
		<script>
			/*
			
			<목적태그>
			
			태그내용
			
			</목적태그>
			
			*/
			$("#app").click(function(){//닫히기 직전에 삽입되는 것이 append
				$("#iot").append("<i>반갑습니다.</i>");
			});
			$("#pre").click(function(){
				$("#iot").prepend("<i>안녕하세요.</i>");
			});
			$("#addTag").click(function(){
				$("body").append("<h1>새로운 태그가 생겨났습니다.</h1>");//맨 밑 바디태그 바로 밑에
			});
			//append 요소를 대상 태그가 끝나기 바론 전에 삽입
			//after 요소를 대상 태그가 종료된 바로 뒤에 삽입
			
			$("#next").click(function(){//닫히고 나서 삽입
				$("#iot").after("<i>새로운 태그</i>");//append와 태그 삽입 위치가 다르다.
			});
			$("#befo").click(function(){//닫히고 나서 삽입
				$("#iot").before("<i>새로운 태그</i>");//append와 태그 삽입 위치가 다르다.
			});
		</script>
	</body>
</html>