<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>애니메이션</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<p>동작실행</p>
		<div style = "width:200px; height:200px; background-color:blue; position:absolute;"></div>
		<script>
			$("p").click(function(){
				$("div").animate({
					/*right:"200px",
					opacity:"0.1",
					height:"+=50px",
					width:"+=50px"*/
					width:"toggle",
					height:"toggle"
					});
				//$("div").animate({left:"200px"});
			});
		</script>
	</body>
</html>