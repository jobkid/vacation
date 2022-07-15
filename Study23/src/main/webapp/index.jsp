<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>EL의 활용</title>
	</head>
	<body>
		<!-- EL(Expression Language) -->
		<%out.print("Test"); %><br><!-- 일반 스크립트릿을 사용하는 방법 -->
		<%="Test" %><br><!-- 스크립트 릿 표현식을 사용하는 방법 -->
		${"Test"}<br><!-- EL을 사용하는 방법 'JSP에서 스크립트릿을 제거하는 용도-->
		
		<!-- EL의 종류 -->
		정수형 : ${10}<br>
		실수형 : ${5.6}<br>
		문자열형 : ${"iot융합 프로그래밍"}<br>
		논리형 : ${true}<br>
		null형 : ${null}<br>
		
		<a href="expr.jsp">계산법 확인</a>
	</body>
</html>