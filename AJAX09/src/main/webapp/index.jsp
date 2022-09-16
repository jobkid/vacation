<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>서식 유효성 검증</title>
	</head>
	<body>
		<h1>다음의 내용을 검증합니다.</h1>
		생일을 입력해주세요.<input type = "text" size = "10" id = "birthDate" onchange = "validate()">
		<div id = "dateMessage"></div>
		<script>
			var XHR;
			function createXMLHttpRequest(){
				if(window.ActiveXObject){
					XHR = new ActiveXObject("Microsoft.XMLHTTP");
				}else if(window.XMLHttpRequest){
					XHR = new XMLHttpRequest();
				}
			}
			createXMLHttpRequest();
			console.log(XHR);
			
			//자바스크립트는 괄호안에 0 이외의 데이터를 넣으면 참이다.
			//유효성 검증 처리를 진행할 함수
			function validate(){
				createXMLHttpRequest();//XHR변수 내부를 초기화
				var date = document.getElementById("birthDate");
				var text = date.value;
				var url = "TestServlet.do?birthDate="+text;
				//console.log("전송데이터 확인: "+url);
				XHR.open("GET", url, true);//
				XHR.onreadystatechange=handleStateChange;
				XHR.send(null);//post의 경우 데이터를 넣어줘야한다. get은 url이므로 null로 그냥 간다.
			}
			function handleStateChange(){
				if(XHR.readyState==4){
					if(XHR.status==200){
						//var res = XHR.responseXML;
						var mes = XHR.responseXML.getElementsByTagName("message")[0].firstChild.data;
						var val = XHR.responseXML.getElementsByTagName("passed")[0].firstChild.data;
						//console.log(mes);
						//console.log(val);
						setMessage(mes, val)
					}
				}
			}
			//사용자에게 안내문을 보여주는 부분
			function setMessage(message, passed){
				var messageArea = document.getElementById("dateMessage");
				var fontColor="red";
				if(passed == "true"){
					fontColor = "green";
				}
				messageArea.innerHTML = "<span style = 'color:"+fontColor+";'>"+message+"</span>";
			}
		</script>
	</body>
</html>