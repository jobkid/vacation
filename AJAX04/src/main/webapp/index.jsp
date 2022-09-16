<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>response parsing</title>
	</head>
	<body>
		<form action="#">
			<input type="button" value="iot 과목확인" onclick="startRequest('iot')">
			<input type="button" value="web 과목확인" onclick="startRequest('web')">
			<input type="button" value="app 과목확인" onclick="startRequest('app')"><hr>
			<input type="button" value="전체조회" onclick="startRequest('all')">
		</form>
		<script>
			var XHR;
			var type="";	//내용 변경시 참조할 변수
			function createXMLHttpRequest(){
				if(window.ActiveXObject){
					XHR=new ActiveXObject("Microsoft.XMLHTTP");
				}else if(window.XMLHttpRequest){
					XHR=new XMLHttpRequest();
				}
			}
			function startRequest(requestType){
				type=requestType;
				createXMLHttpRequest();
				XHR.onreadystatechange=handleStateChange;
				XHR.open("GET", "parse.xml", true);
				XHR.send(null);
			}
			function handleStateChange(){
				if(XHR.readyState==4){
					if(XHR.status==200){
						if(type=="iot"){
							listIOT();
						}else if(type=="web"){
							listWEB();
						}else if(type=="app"){
							listAPP();
						}else if(type=="all"){
							listALL();
						}
						
					}
				}
			}
			function listALL(){
				var XMLDOC=XHR.responseXML;
				var cla=XMLDOC.getElementsByTagName("class")[0];
				var out="<<전체과목>>";
				var subject=cla.getElementsByTagName("subject");
				output(out, subject);
			}
			
			function listIOT(){
				var XMLDOC=XHR.responseXML;
				var iot=XMLDOC.getElementsByTagName("iot")[0];
				var out="<<iot 과목>>";
				var subject=iot.getElementsByTagName("subject");
				output(out, subject);
				console.log(subject);
			}
			
			function listWEB(){
				var XMLDOC=XHR.responseXML;
				var iot=XMLDOC.getElementsByTagName("web")[0];
				var out="<<web 과목>>";
				var subject=iot.getElementsByTagName("subject");
				output(out, subject);
				console.log(subject);
				
			}
			function listAPP(){
				var XMLDOC=XHR.responseXML;
				var iot=XMLDOC.getElementsByTagName("app")[0];
				var out="<<app 과목>>";
				var subject=iot.getElementsByTagName("subject");
				output(out, subject);
				console.log(subject);
			}
			function output(title, subject){
				var out=title;
				var name=null;
				for(var i=0; i<subject.length; i++){
					name=subject[i];
					out=out+"\n"+name.childNodes[0].nodeValue;
				}
				alert(out);
			}
		</script>
	</body>
</html>