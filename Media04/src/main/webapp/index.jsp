<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>반응형 요소 지우기</title>
		<style>
			#wrap{
				width : 90%;
				margin : 0 auto;
				border: 4px solid black;
				font-size:0;
			}
			#header{
				height:50px;
				background-color:red;
			}
			#content div{
				height : 300px;
				width: 50%;
				display:inline-block;
			}
			#content div:first-child{
				background-color:orange;
			}
			#content div:last-child{
				background-color:yellow;
			}
			#footer{
				height:50px;
				background-color:blue;
			}
			@media screen and (max-width:500px){
				#header{
					width:50%;
					height:300px;
					display:inline-block;
				}
				
				#content{
					width : 50%;
					height : 300px;
					display : inline-block;
				}
				#content div{
					width : 100%;
					height : 150px;
				}
				#footer{
					/*visibility:hidden; 면적이 보이지 않아도 남아있음.*/
					display : none;
				}
			}
		</style>
	</head>
	<body>
		<div id = "wrap">
			<div id = "header"></div>
				<div id = "content">
					<div></div>
					<div></div>
				</div>
			<div id = "footer"></div>
		</div>
		<script>
			
		</script>
	</body>
</html>