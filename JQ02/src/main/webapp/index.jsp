<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jQuery 기초문법</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	</head>
	<body>
		<h1>h1입니다.</h1><!-- style="display:none" -->
		<h2 id="hid">h2입니다. id는 hid입니다.</h2>
		<h3 class = "hclass">h3입니다. class hclass입니다.</h3>
		<h4 class = "hclass">h4입니다. class hclass입니다.</h4>
		<h5 class = "hclass">h5입니다. class hclass입니다.</h5>
	</body>
	<script>
		//document.getElementsByTagName("h1")[0].style.display="none";
		//console.log(test);
		//document.getElementById("hid").style.display="none";
		//var test=document.getElementsByClassName("hclass");
		//console.log(test);
		/*
		document.getElementsByClassName("hclass")[0].style.display="none";
		document.getElementsByClassName("hclass")[1].style.display="none";
		document.getElementsByClassName("hclass")[2].style.display="none";
		*/
		$(document).ready(function(){
			$("h1").hide();
			$("#hid").hide();
			$(".hclass").hide();
		});
		
	</script>
</html>