<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>제이쿼리 효과처리 fadeout</title>
	</head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<body>
		<p>클릭하여 페이드 아웃 처리</p>
		<div id = "out1" style = "background-color:red; width:100px; height : 100px;"></div>
		<div id = "out2" style = "background-color:blue; width:100px; height : 100px;"></div>
		<div id = "out3" style = "background-color:green; width:100px; height : 100px;"></div>
		<div id = "out4" style = "background-color:black; width:100px; height : 100px;"></div>	
		<script>
			//fadeout : 서서히 사라지는 효과
			//$(선택자).fadeout(시간, 종료시 수행할 함수);
			$("p").click(function(){
				$("#out1").fadeOut();
				$("#out2").fadeOut("slow");
				$("#out3").fadeOut(5000);//1000초 동안 해당 효과가 발생하다록 지정 가능
				$("#out4").fadeOut(5000, function(){
					alert("효과종료!!");
				});
			});
		</script>
	</body>
</html>