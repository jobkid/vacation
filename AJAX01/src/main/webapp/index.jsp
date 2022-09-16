<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>XMLHttpRequest</title>
	</head>
	<body>
		<script>
			//XMLHttpRequest : 과거 인터넷 브라우저에서 ActiveX형식으로 제공된 내용
			//모든 브라우저마다 작동방식이 조금씩 다른 문제점이 있다.
			//W3C표준이 아니므로 IE에서는 ActiveX Component형식으로 구현되었고
			//다른 브라우저에서는 JavaScript Object방식으로 구현되었다.
			//현재는 JavaScript Object 방식 XHR에 접근할 수 있다.
			var XHR;
			function createXMLHTTPRequest(){
				//자바스크립트에서는 if문에서 변수가 있으면 참이다. 
				if(window.ActiveXobject){
					XHR = new ACtiveXobject("Microsoft.XMLHTTP");
				}else if(window.XMLHttpRequest){
					XHR=new XMLHttpRequest();
				}
			}
			createXMLHTTPRequest();
			console.log(XHR);
		</script>
	</body>
</html>