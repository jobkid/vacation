<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jQuery와 CSS선택자</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<form>
			<h1>회원가입</h1>
			<hr>
			<h2>뉴스레터 정보</h2>
			<span class = "tag">이름 : </span><input type="text"><br>
			<span class = "tag">이메일 : </span><input type="text"><br>
			<span class = "tag">비밀번호 : </span><input type="password"><br>
			<span class = "tag">소속 : </span>
			<input type = "radio" name = "check">학교
			<input type = "radio" name = "check">기관
			<input type = "radio" name = "check">기업
			<hr>
			<h2>뉴스 카테고리</h2>
			<span class = "tag">경제 : </span><input type = "checkbox" name = "checkbox-1" checked><br>
			<span class = "tag">사회 : </span><input type = "checkbox" name = "checkbox-2"><br>
			<span class = "tag">문화 : </span><input type = "checkbox" name = "checkbox-3"><br>
			<input type = "reset" id = "btn-1" value = "초기화">
			<input type = "button" id = "btn-2" value = "버튼">
			<input type = "submit" id = "btn-3" value = "제출">
			<hr>
			<h2>제작중</h2>
			<input type = "reset" id = "btntest-1" value = "테스트1">
			<input type = "button" id = "btntest-2" value = "테스트2">
			<input type = "submit" id = "btntest-3" value = "테스트3">
		</form>
		<script>
			$(document).ready(function(){
				$("form").attr("style", "border : 1px solid black; background-color : azure;");
				$(".tag").attr("style", "width : 100px; text-align : center; display:inline-block;");
				//가상선택자
				$(":header").attr("style", "color:red;");
				$(":header:not(h1)").attr("style", "color:blue;");
				$("input:password").attr("style", "background-color : black; color : white;");
				$("input:checked").attr("style", "width:20px; height:20px;");
				$("input[id]").attr("style", "color:blue;");
				$("input[id^=b]").attr("style", "background-color:red;");
				$("input[id|=btn").attr("style", "background-color:gray;");
				$("input[id$=3]").attr("style", "background-color:black; color:white;");
			});
			//document.getElementsByTagName("form");
		</script>	
	</body>
</html>