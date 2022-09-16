<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>tag값 전송</title>
	</head>
	<body>
		<div id="wrap">
			<p>일반 p태그의 값 전송</p>
			<form method="post" action="submit.jsp">
				<input type="hidden" name="ptag" value="일반 p태그의 값 전송">
				<input type="submit" value="전송!">
			</form>
		</div>
		<script>
			let wrap=document.getElementById("wrap");
			let ptag=wrap.getElementsByTagName("p")[0];
			let value=ptag.innerHTML;
			console.log(value);
			
			let hidden=document.getElementById("hiddentag");
			hidden.value=value;
		</script>
	</body>
</html>