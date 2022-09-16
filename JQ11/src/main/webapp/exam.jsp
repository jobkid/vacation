<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>제이쿼리 실습</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<style>
			*{
				padding : 0;
			}
			#wrap{
				margin : 0 auto;
				width : 800px;
				border : 10px solid green;
			}
			div > div{
				width : 200px;
				height:100px;
				background-color:black;
				margin:0;
				float:left;
			}
			div > div:ntn-child(2n){
				background-color:yellow;
			}
			div > div:first-child{
				width : 800px;
				height : 150px;
				background-color:blue;
			}
			div > div:last-child{
				width : 800px;
				height : 150px;
				background-color:red;
			}
			#wrap:after{
				display:block;
				content:"";
				clrear:both;
			}
		</style>
	</head>
	<body>
	<div id = "wrap">
		<div id="blue" style = "display : none;"></div>
					<div class = "yellow"></div><div class = "black"></div><div class="yellow"></div><div class = "black"></div>	
		<div id="red" style = "display : none;"></div>
	</div>
	<script>
	$(".yellow").click(function(){
		$("#blue").sildeToggle();
	});
	$(".black").click(function(){
		$("#red").sildeToggle();
	});
	</script>
	</body>
</html>