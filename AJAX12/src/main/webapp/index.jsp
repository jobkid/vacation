<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>화면의 비동기 갱신</title>
	</head>
	<body>
		<form action="#">
			<h3>종류 선택</h3>
			<select id = "race" onchange="Conn()">
				<option value = "">선택해주세요</option>
				<option value = "dog">강아지</option>
				<option value = "cat">고양이</option>
				<option value = "racon">너구리</option>
			</select>
			<h3>크기 선택</h3>
			<select id = "size" onchange="Conn()">
				<option value = "">선택해주세요</option>
				<option value = "small">소형</option>
				<option value = "medium">중형</option>
				<option value = "large">대형</option>
			</select>
			<h3>데이터 출력</h3>
			<select id="list" size="6" style = "width:300px;">
			
			</select>
		</form>
		<script>
			var XHR;
			function createXMLHttpRequest(){
				if(window.ActiveXObject){
					XHR = new ActiveXObeject();
				}else if(window.XMLHttpRequest){
					XHR=new XMLHttpRequest();
				}
			}
			function clearList(){
				var list = document.getElementById("list");
				while(list.childNodes.length>0){
					list.removeChild(list.childNodes[0]);
				}
			}
			
			function updateList(){
				clearList();
				var list = document.getElementById("list");	
				var result = XHR.responseXML.getElementsByTagName("pet");
				var option = null;
				for(var i=0; i<result.length; i++){
					option = document.createElement("option"); //<option> 태그 생성
					option.appendChild(document.createTextNode(result[i].firstChild.nodeValue));
					list.appendChild(option);
				}
			}
			//onreadystatechange
			function handleStateChange(){
				if(XHR.readyState==4){
					if(XHR.status==200){
						console.log("통신결과 이상 없음");
						console.log(XHR.response);
						//updateList();
					}
				}
			}
			function createQueryString(race, size){
				var query = "race="+race+"&size="+size;
				return query;
			}
			function Conn(){
				var race = document.getElementById("race").value;
				var size = document.getElementById("size").value;
				var url = "RefreshList?"+createQueryString(race, size);
				console.log(url);
				createXMLHttpRequest();
				XHR.onreadystatechange = handleStateChange;
				XHR.open("GET", url, true);
				XHR.send(null);
			}
		</script>
	</body>
</html>