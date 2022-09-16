<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>가변 사이즈, 가변 패딩과 마진</title>
		<style>
			/*
			가변 수치 : 변동하는 값을 가지는 경우
			(목표값/외부박스면적)*100=가변값	
			*/
		
			*{
				margin:0;
				padding:0;
			}
			.wrap{
				width:600px;
				height:200px;
				margin: 0 auto;
				background-color:yellow;
				border:1px solid lightgray;
				padding:20px;
			}
			.blue{
				background-color:blue;
				width:200px;
				height:200px;
				display:inline-block;/*display inline-block은 마진 값을 제거하는 기능을 가지고 있다.*/
				margin-right:50px;
			}
			.red{
				background-color:red;
				width:300px;
				height:200px;
				display:inline-block;
			}/*div는 한 줄을 다 차지한다.*/
			.res-wrap{
				width:70%;
			}
			.res-blue{
				/*(200/600)*100=33.33%*/
				width:33.33%;
			}
			.res-margin{
				/*(50/600)*100=8.33%*/
				margin-right:8.33%;
			}
		</style>
	</head>
	<body>
		<div class="wrap">
			<div class="blue"></div>
			<div class="red"></div>
		</div>
		<div class="wrap res-wrap"><!-- 클래스는 한 개 테그가 여러개를 가질 수 있다. -->
			<div class="blue res-blue res-margin"></div>
			<div class="red"></div>
		</div>
	</body>
</html>