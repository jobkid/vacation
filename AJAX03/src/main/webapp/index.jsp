<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>response의 사용</title>
	</head>
	<body>
		<form action="#">
			<input type="button" value="테스트!" onclick="startRequest()">
		</form>
		<div id="results"></div>
		<script>
			var XHR;
			function createXMLHttpRequest(){
				if(window.ActiveXObject){
					XHR=new ActiveXObject("Microsoft.XMLHTTP");
				}else if(window.XMLHttpRequest){
					XHR=new XMLHttpRequest();
				}
				console.log(XHR)
			}
			function startRequest(){
				createXMLHttpRequest();						//평선을 이용해서 XHR변수를 초기화
				XHR.onreadystatechange=handleStateChange;	//XHR의 상태변화시 수행될 function을 지정
				XHR.open("GET", "data.xml", true);			//통신회선 연결
				XHR.send(null);								//request처리 XHR이 보냄.
				console.log("동작이상없음");
			}
			function handleStateChange(){
				if(XHR.readyState==4){//통신이 잘 정상적으로 됐을 때 시작해라
					if(XHR.status==200){//
						document.getElementById("results").innerHTML=XHR.responseText;
					}
				}
				console.log("상태값 변경 : "+XHR.readyState);
			}
		</script>
	</body>
</html>