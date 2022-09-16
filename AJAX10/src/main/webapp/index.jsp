<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>AJAX get 통신</title>
		<script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<input type = "text" placeholder = "여기에 값을 입력">
		<input type = "button" value = "전송">
		<h1 id = "request"></h1>
		<h1 id = "response"></h1>
		<h1 id = "status"></h1>
		<script>
			$("input[type=button]").click(function(){
				//alert("동작확인");
				var data=$("input[type=text]").val();
				//get방식으로 비동기식 통신을 수행
				$.get("TestServlet?data="+data, function(response, status){
					$("#request").text("전송한 값 : "+data);
					$("#response").text("전송받은 값 : "+response);
					$("#status").text("통신상태 값 : "+status);
				});
			});
		</script>
	</body>
</html>