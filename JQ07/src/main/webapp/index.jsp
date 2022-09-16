<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>제이쿼리의 기본 효과</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<p>지금 내용을 변경합니다.</p>
		<input type = "button" id="hide_btn" value="숨기기">
		<input type = "button" id="show_btn" value="보이기">
		<script>
			//jQuery.method()들은 일반 javascript에서는 사용할 수 없다.
			$("#hide_btn").click(function(){
				$("p").hide();
			});
			$("#show_btn").click(function(){
				$("p").show();
			})
		/*
			var hide=document.getElementById("hide_btn");
			var show=document.getElementById("show_btn");
			var p=document.getElementsByTagName("p")[0];
			/*
			console.log(hide);
			console.log(show);
			console.log(p);
			hide.addEventListener("click", function(){
				//p.setAttribute("style", "display:none;");
				p.style.display="none";
			});
			show.addEventListener("click", function(){
				//p.style.display="block";
				p.setAttribute("style", "display:block;");
			})
				*/
		</script>
	</body>
</html>