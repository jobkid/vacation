<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>자동완성</title>
		<style>
			#nameTable{
				border : 1px solid black;
				background-color : azure;
			}
			.mouse:hover{
				background-color:black;
				color:white;
			}
		</style>
	</head>
	<body>
		<h1>자동완성 기능 구현</h1>
		<input type = "text" size="20" id="names" onkeyup="findNames()">
		<div id="popup">
			<table id = "nameTable">
				<tbody id = "nameTableBody">
					<tr class = "mouse">
						<td>자동완성</td>
					</tr>
					<tr class = "mouse">
						<td>모양확인</td>
					</tr>
					<tr class = "mouse">
						<td>이렇게 보임</td>
					</tr>
				</tbody>
			</table>
		</div>
		<script>
			var XHR;			//XMLHttpRequest : 통신을 수행하는 주체, request, response값을 보관
			var div;			//자동완성이 된 내용이 표현되는 부분
			var input; 			//자동완성될 단어를 입력하는 부분
			var nameTable;		//자동완성된 항목이 적힐 테이블
			var nameTableBody;	//테이블의 내용이 기록될 몸통
			function createXMLHttpRequest(){
				if(window.ActiveXObject){
					XHR = new ActiveXObject();
				}else if(window.XMLHttpRequest){
					XHR = new XMLHttpRequest();
				}
			}
			//초기값 지정 함수
			function init(){
				input = document.getElementById("names");
				nameTable = document.getElementById("nameTable");
				nameTableBody = document.getElementById("nameTableBody");
				div = document.getElementById("div");
			}
			//키보드가 눌렸다 떼질 때 실행되는 함수
			function findNames(){
				init();
				createXMLHttpRequest();
				console.log(input.value);
				var url="AutoServlet?names="+input.value;
				XHR.open("GET", url, true);
				XHR.onreadystatechange = handleStateChange;
				XHR.send(null);
			}
			function handleStateChange(){
				if(XHR.readyState==4){//data
					if(XHR.status==200){
						//console.log(XHR.responseXML.getElementsByTagName("name"));
						setNames(XHR.responseXML.getElementsByTagName("name"))
					}else if(XHR.status==204){
						//서블릿과 리소스는 존재하지만 반환 데이터가 없는 경우
						//204코드는 서블릿에서 지정할 수 있음.
						clearNames();
					}
				}
			}
			
			//response된 데이터를 화면에 표시해주는 함수 AJAX는 통신만 한다.
			function setNames(arr){
				clearNames();
				var size = arr.length;
				var row;				//tr
				var cell;				//td
				var textNode;
				for(var i=0; i<size; i++){
					var text = arr[i].firstChild.data;
					row = document.createElement("tr");
					cell = document.createElement("td");
					row.setAttribute("class", "mouse");
					row.setAttribute("bgColor", "azure");
					cell.onclick=function(){
						clickName(this);
					}
					textNode = document.createTextNode(text);
					cell.appendChild(textNode);	//<td>text</td>
					row.appendChild(cell); 			//<tr><td>text</td></tr>
					nameTableBody.appendChild(row)
;				}
			}
			
			//원래 있던 내용을 화면에서 지우는 기능
			function clearNames(){
				var size = nameTableBody.childNodes.length;
				for(var i = size-1; i>=0; i--){
					nameTableBody.removeChild(nameTableBody.childNodes[i]);
					console.log("사이즈 : "+i);
					console.log(nameTableBody.childNodes[i]);
				}
				nameTable.style.border = "none";
			}
			
			//클릭해서 해당 내용을 인풋에 입력하는 기능
			function clickName(cell){
				input.value = cell.firstChild.nodeValue;
				clearNames();
			}
		</script>
	</body>
</html>