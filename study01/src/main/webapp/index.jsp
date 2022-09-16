<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>제목은 여기에</title>
	</head>
	<body>
		<h1>Hello, world!</h1>
		<% out.println("<h1>자바로 입력한 내용입니다.</h1>"); %>
		<%
			/*자바 코드는 jsp파일 내부의 스크립트릿으로 구분된 영역에 작성해야 한다.
			작성된 스크립트릿 내부의 변수 등 값을 참조하는 경우 아래와 같이 사용할 수 있다.*/
			
			int a=10;
			int b=20;
			int sum=a+b;
			//out.println("<h1>변수 a와 b의 합은 <i>"+sum+"</i>입니다.</h1>");
			
		%>
		<h1>변수 a와 b의 합은 <i><%=sum %></i>입니다.</h1>
		<!-- HTML의 주석은 다음과 같이 작성합니다. -->
		
		<%--스크립트릿의 주석은다음과 같이 작성합니다. --%>
		<%//자바의 주석은 다음과 같이 작성합니다. %>
	</body>
</html>