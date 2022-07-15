<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>브라우저에서의 Request처리</title>
	</head>
	<body>
		<form a="#">
			<input type="button" value="테스트!" onclick="startRequest()">
		
		</form>
		<script>
			//XMLHttpRequest 객체를 가져오는 부분
			var XHR;													//속이 빈 변수
			function createXMLHttpRequest(){							//IE와 다른 브라우저를 구별해서
				if(window.ActiveXObject){								//IE인 경우
					XHR=new ActiveXObject("Microsoft.XMLHTTP");			//마이크로소프트방식으로 XHR구성
				}else if(window.XMLHttpRequest){						//다른 브라우저인 경우
					XHR=new XMLHttpRequest();							//일반적인 방식으로 XHR구성
				}
				//console.log(XHR)
			}
			function startRequest(){									//버튼 누르면 실행될 함수
				createXMLHttpRequest();									//XHR을 초기화
				XHR.onreadystatechange=handleStateChange;				//XHR통신 상태변화 시 실행할 함수 지정	
				console.log("request 이전 : "+XHR.readyState);			//통신걸기 이전 상태가 0임을 확인
				XHR.open("GET", "data.xml", true);						//통신을 거는 함수
				console.log("request 이후 : "+XHR.readyState);			//통신직후 상태가 1임을 확인
				XHR.send(null);											//데이터 전송
			}
			function handleStateChange(){								//XHR상태변화 때마다 실행될 함수
				if(XHR.readyState==4){									//통신이 정상인 경우
					if(XHR.status==200){								//목적지가 존재하는 경우
						alert("다음의 정보 전달 : "+XHR.responseText);		//통신의 결과물을 출력해달라.
					}
				}
				console.log("상태값 변경 : "+XHR.readyState);
			}
			//XMLHttpRequest.open(method, url, asynch, user,pw);
			//해당 경로로 Request를 전달하는 기능
			//XMLHttpRequest.send();
			//실질적으로 데이터를 서버로 전송하는 부분 get방식이라면 null을 전송하고 post방식은 데이터를 전송
			
			//XMLHttpRequest의 속성값
			//XMLHttpReques.onreadystatechange : function을 저장하는 부분
			//CMLHttpRequest.onreadyState : 요청의 상태값을 확인할 수 있는 부분
			// 0 : uninitialized, 초기화되지 않은 상태
			// 1 : loading, 읽고 있는 상태
			// 2 : loaded, 정보를 다 읽은 상태
			// 3 : interactive, 읽은 정보를 가져오는 상태
			// 4 : complete, 모든 요청이 완료된 상태
			// XMLHttpRequest.responseText : 응답받은 데이터를 String표현
			// XMLHttpRequest.responseXML : 응답받은 데이터를 XML로 표현
			
			
		</script>
	</body>
</html>