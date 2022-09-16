<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>제이쿼리 입문</title>
		<!-- <script src="https://code.jquery.com/jquery-3.6.0min.js"></script> -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	</head>
	<body>
		<p>눌러서 지우기</p>
		<script>
		/*	function event(){//this는 자바에서 객체
				this.style.display="none";
			}
			var p=document.getElementsByTagName("p")[0];
			p.addEventListener("click", event);
			*/
			//같은 기능을 수행하는 jQuery와 비교
			//요소를 특정하는 기능
			$(document).ready(function(){
				$("p").click(function(){
					$(this).hide();
				});
			});
			
		</script>
	</body>
</html>