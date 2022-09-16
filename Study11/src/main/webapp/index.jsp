<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<title>쿠키생성</title>
	</head>
	<body>
		<%
			//쿠키 "객체"는 해당 정보가 브라우저에 저장된다.
			//생성된 쿠키 객체는 브라우저를 통해 통신되는 모든 jsp파일이 공유한다.
			//Cookie("String key","String value");
			//쿠키의 key에는 특수문자 또는 기호가 들어갈 수 없다.
			Cookie cookie=new Cookie("data","cookiedata123456");
			
			//쿠키 객체에는 존재할 수 있는 시간이 존재하며 해당 시간이 지나면 사라진다.
			cookie.setMaxAge(60*60);//초단위로 지정 가능하다.//곱셉으로 나눠서 표현
			
			response.addCookie(cookie);
		%>
		<h1>쿠키 값을 저장한 인덱스 페이지</h1>
		<a href="view1.jsp">쿠키값 확인하러 가기</a>
		
	</body>
</html>