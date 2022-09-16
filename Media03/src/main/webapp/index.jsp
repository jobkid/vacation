<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Insert title here</title>
		<style>
			#wrap{
				margin:0 auto;
				width : 90%;
				border : 4px solid black;
				font-size:0;
			}
			#wrap div{
				width:33.33%;
				height:400px;
				display:inline-block;
			}
			#red{
				background-color : red;
			}
			#orange{
				/*width:33.33%;
				height:400px;*/
				background-color : orange;
			}
			#yellow{
				/*width:33.33%;
				height:400px;*/
				background-color : yellow;
			}
			@media screen and (max-width:500px){
				#wrap div:first-child{
					width:50%;
					height:200px;
				}
				#wrap div:nth-child(2){
					width:50%;
					height:200px;
				}
				#wrap div:last-child{
					width:100%;
					height:200px;
				}
			}
			@media screen and (max-width:400px){
				#wrap{
					width:100% !important;
				}
				#wrap div{
					width:100% !important;
				}
			}
			/*
				#wrap div{
					width:33.33%;
					height:400px;
				}
				#wrap div:first-child{
					background-color : red;
				}
				#wrap div:nth-child(2){
					background-color : orange;
				}
				#wrap div:last-chile{
					background-color : yellow;
				}
			*/
		</style>
	</head>
	<body>
		<div id="wrap">
			<div id="red"></div>
			<div id="orange"></div>
			<div id="yellow"></div>
		</div>	
	</body>
</html>