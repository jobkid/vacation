<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>패러미터의 전송</title>
	</head>
	<body>
		<h1>패러미터를 입려하여 전송</h1>
		첫번째 패러미터 : <input type="text" id="first"><br>
		두번째 패러미터 : <input type="text" id="second"><br>
		세번째 패러미터 : <input type="text" id="last"><br>
		<form action="#">
			<input type="button" value="GET방식 전송" onclick="request_doGet()">
			<input type="button" value="POST방식 전송" onclick="request_doPost()">
		</form>
		<hr><h2>서버 response</h2>
		<div id="serverResponse"></div>
		<script>
			var XHR;
			function createXMLHttpRequest(){
				if(window.ActiveXObject){
					XHR=new ActiveXObject("Microsoft.XMLHTTP");
				}else if(window.XMLHttpRequest){
					XHR=new XMLHttpRequest();
				}
			}
			function createString(){
				var first=document.getElementById("first").value;
				var second=document.getElementById("second").value;
				var last=document.getElementById("last").value;
				var dataString="first="+first+"&second"+second+"&last="+last;
				return dataString;
			}
			//GET방식의 Request 구현
			function request_doGet(){
				createXMLHttpRequest();
				var dataString="Test?";
				dataString+=createString();
				//alert(dataString);
				console.log(dataString);
				XHR.onreadystatechange=handleStateChange;
				XHR.open("GET", dataString, true);
				XHR.send(null);
			}
			
			//POST 방식의 Request 구현
			function request_doPost(){
				createXMLHttpRequest();
				var url="Test";
				dataString=createString();
				XHR.onreadystatechange=handleStateChange;
				XHR.open("POST", url, true);
				XHR.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				XHR.send(dataString);
			}
			
			function handleStateChange(){
				if(XHR.readyState==4){
					if(XHR.status==200){
						console.log("정상동작");
						parseResult();
					}
				}
			}
			
			//화면에 표시하는 기능
			function parseResult(){
				var div=document.getElementById("serverResponse");
				if(div.hasChildNodes()){
					div.removeChild(div.childNodes[0]);
				}
				var text=document.createTextNode(XHR.responseText);
				div.appendChild(text);
			}
		</script>
	</body>
</html>