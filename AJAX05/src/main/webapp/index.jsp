<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>동적 데이터 확인</title>
	</head>
	<body>
		<h1>동적 웹 개발 구현</h1>
		<form action="#">
			가격대를 선택해 주세요
			<select>
				<option value="500000">500000</option>
				<option value="1000000">1000000</option>
				<option value="1500000">1500000</option>
			</select>
			에서
			<select>
				<option value="1000000">1000000</option>
				<option value="2000000">2000000</option>
				<option value="3000000">3000000</option>
			</select>
			<input type="button" value="조회!" onclick="search()">
		</form>
		<span id="header"></span>
		<table id="resultsTable">
			<tbody id="resultsBody"></tbody>
		</table>
		<script>
			var XHR;
			function createXMLHttpRequest(){
				if(window.ActiveXObject){
					XHR=new ActiveXObject("Microsoft.XMLHTTP");
				}else if(window.XMLHttpRequest){
					XHR=new XMLHttpRequest();
				}
			}
			function search(){
				createXMLHttpRequest();
				XHR.onreadystatechange=handleStateChange;
				XHR.open("GET", "dynamic.xml", true);
				XHR.send(null);
			}
			function handleStateChange(){
				if(XHR.readyState==4){
					if(XHR.status==200){
						//원래 적혀 있던거 지우는 동작
						//통신을 통해 새로 받아온 데이터를 그리는 동작
						clearResult();
						parseResult();
					}
				}
			}
			//데이터를 지우는 동작
			function clearResult(){
				var header=document.getElementById("header");
				if(header.hasChildNodes()){
					header.removeChild(header.childNodes[0]);
				}
				var resultsBody=document.getElementById("resultsBody");
				while(resultsBody.childNodes.length>0){
					resultsBody.removeChild(resultsBody.childNodes[0]);
				}
			}
			//데이터를 그리는 동작
			function parseResult(){
				var result=XHR.responseXML;
				var product=null;
				var name="";
				var price="";
				var comments="";
				var products=result.getElementsByTagName("product");
				for(var i=0; i<products.length; i++){
					product=products[i];
					name=product.getElementsByTagName("name")[0].firstChild.nodeValue;
					price=product.getElementsByTagName("price")[0].firstChild.nodeValue;
					comments=product.getElementsByTagName("comments")[0].firstChild.nodeValue;
					//테이블 내부에 해당 내용 집어넣기
					addTableRow(name, price, comments);
					
				}
				var header=document.createElement("h2");
				var headerText=document.createTextNode("검색결과 : ");
				header.appendChild(headerText);
				document.getElementById("header").appendChild(header);
				document.getElementById("resultsTable").setAttribute("border", "1");
			}
			//테이블 내부에 자료를 집어넣는 동작
			function addTableRow(name, price, comments){
				var min=document.getElementsByTagName("select")[0].value;//최소값
				var max=document.getElementsByTagName("select")[1].value;//최대값
				var int_price=parseInt(price);
				if(min<=int_price && max>=int_price){
					var row=document.createElement("tr");
					var cell=createTD(name);
					row.appendChild(cell);
					cell=createTD(price);
					row.appendChild(cell);
					cell=createTD(comments);
					row.appendChild(cell);
					document.getElementById("resultsBody").appendChild(row);
				}
			}
			//td를 생성해주는 동작
			function createTD(text){
				var cell=document.createElement("td");
				var textNode=document.createTextNode(text);
				cell.appendChild(textNode);
				return cell;
			}
		</script>
	</body>
</html>