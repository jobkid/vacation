<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jQuery Ajax</title>
		<script src= "https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<p>통신 요청</p>
		<h1 id = "response"></h1>
		<h1 id = "status"></h1>
		<h1 id = "xhr"></h1>
		<script>
			//$.ajax();
			//$.ajax(url, option);
			//$(String)
			//post로 전송시키려면 타입.
			
			//https://code.jquery.com/jquery-3.6.0.min.js
			$("p").click(function(){
				$.ajax("JQAX", {
						type:"POST",
						data:{
							name:"똘이",
							race:"말티즈"},
						success:function(response, status, xhr){
							$("#response").text(response);
							$("#status").text(status);
							$("#xhr").text(xhr);
						},
						error:function(xhr, status, errorMessage){
							$("#response").text(xhr);
							$("#status").text(status);
							$("#xhr").html(errorMessage);
							console.log(xhr);
						}
					}
				);
			});
			/*
			$.ajax(url,
					{type : "POST",
					data : {
						key:{
							0:vlaue,
							1:value,
							2:value
						},
						key:value
					},
					option:function(){
						
					}
			})*/;
		</script>
	</body>
</html>