<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>반응형 메뉴</title>
		<style>
			*{
			/*기본 디자인을 제거하는 초기화를 먼저 수행한다.*/
				margin : 0;
				padding : 0;
			}
			#wrap{
				width:80%;
				margin:0 auto;
				padding:5%;
				background-color:lightgray;
				border:4px solid black;
			}
			#wrap ul{
				list-style:none;
			}
			#wrap li{
				border:1px solid black;
				width:15%;
				text-align:center;
				font-size:1vw;
				float:left;
				padding:2.2%;
			}
			#wrap li:hover{
				color:white;
				background-color:black;
			}
			#wrap:after{/*클리어 픽스 떠있는 플롯을 고정.
			*/
				content:"";
				display:block;
				clear:both;
			}
			#wrap input{
				display:none;
				width:95%;
				margin:0 auto;
			}
			
			@media all and (max-width:450px){
				#wrap li{
					width:90%;
					font-size:5vw;
				}
			}
			@media all and (max-width:300px){
				#wrap input{
					display:block;
					margin:0;
				}
				#wrap ul{
					display:none;
				}
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<ul>
				<li>JAVA</li>
				<li>JAVASCRIPT</li>
				<li>HTML</li>
				<li>CSS</li>
				<li>ANDROID</li>
			</ul>
			<input type="button" value="메뉴버튼">
			<input type="button" value="X">
			<!-- css에서 #wrap:after 부분    -->
		</div>
		<script>
			let btn=document.getElementsByTagName("input")[0];
			let close=document.getElementsByTagName("input")[1];
			close.style.display="none";
			let ul=document.getElementsByTagName("ul")[0];
			//console.log(ul);
			//console.log(btn);
			//console.log(close);
			
			btn.addEventListener("click", function(){
				ul.style.display="block";
				btn.style.display="none";
				close.style.display="block";
			});
			close.addEventListener("click", function(){
				ul.style.display="none";
				btn.style.display="block";
				close.style.display="none";
			});
			
			
			//반응형은 자바스크립트로도 구현이 가능하다.
			//style값은 자바스크립트로 구현할 경우 inline-style이 되어 우선권을 가지므로 주의!
			window.addEventListener("resize", function(){
				let win = window.innerWidth;
				console.log("화면 내부 사이즈 : "+win);
				if(win>300){
					btn.style.display="none";
					ul.style.display="block";
					close.style.display="close";
				}else if(win<300){
					btn.style.display="block";
					close.style.display="none";
					ul.style.display="none";
				}
			});
			
			
		</script>
	</body>
</html>