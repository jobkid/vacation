<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>XMLHttpRequest 통신</title>
	</head>
	<body>
		<h1>패러미터를 입력하여 전송</h1>
		첫번째 패러미터 : <input type = "text" id = "first"><br>
		두번째 파라미터 : <input type = "text" id= "second"><br>
		마지막 패러미터 : <input type = "text" id= "last"><br>
		<form action="#">
			<input type = "button" value="GET방식 전송" onclick="request_doGet()"><br>
			<input type = "button" value="POST방식 전송" onclick="request_doPost()">
		</form>
		<hr>
		<h2>서버 response</h2>
		<div id = "serverResponse"></div>
		<script>
			var XHR;	//XMLHttpRequest를 저장하기 위한 변수
			function createXMLHttpRequest(){	//XHR의 내부를 채워주기 위한 함수
				if(window.ActiveXObject){		//ms 익스플로러의 내부에 가질 수 있음.
					XHR = new ActiveXObject("Microsoft.XMLHTTP");//자바스크립트는 데이터가 없으면 거짓	
				}else if(window.XMLHttpRequest){
					XHR = new XMLHttpRequest();
				}
			}
			function createString(){
				var first = document.getElementById("first").value;
				var second = document.getElementById("second").value;
				var last = document.getElementById("last").value;
				var dataString = "first="+first+"&second="+second+"&last="+last;
				//console.log(dataString);
				return dataString;
			}
			function request_doGet(){
				createXMLHttpRequest();//XHR을 제작
				var dataString = "Test?";
				dataString+=createString();
				XHR.onreadystatechange=handleStateChange;//괄호쓰면 안된다. 이유는 결과값으로 대입되기 때문
				XHR.open("GET", dataString, true);
				XHR.send(null);//GET방식은 보내는 데이터가 URL에 이미 적혀있으므로 데이터는따로 보내지 않는다.
				
			}
			function request_doPost(){
				createXMLHttpRequest();
				var url = "Test";
				var dataString=createString();
				XHR.onreadystatechange=handleStateChange;
				XHR.open("POST", url, true);
				XHR.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				XHR.send(dataString);//POST방식은 별도로 데이터를 보내주어야 한다.
			}
			//XHR의 상태값이 변동할 때마다 실행될 함수
			function handleStateChange(){
				if(XHR.readyState==4){
					if(XHR.status==200){
						//	Request와 Response가 온전히 종료된 시점이므로
						//	Response 받아온 데이터를 표현하는 부분
						parseResult();
					}
				}
			}
			//화면에 response 된 데이터를 표현하는 함수
			function parseResult(){
				var div = document.getElementById("serverResponse");
				var text = document.createTextNode(XHR.responseText);
				console.log(XHR.responseText);
				if(div.hasChildNodes()){
					div.removeChild(div.childNodes[0]);
				}
				div.appendChild(text);
			}
		</script>
	</body>
</html>