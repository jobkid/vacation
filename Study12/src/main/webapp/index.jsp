<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>세견데이터 입력</title>
	</head>
	<body>
		<%
			//세션은 만들지 않아도 존재하고 있다.
			//세션은 서버 내부에 마련되어 임시로 데이터를 저장할 수 있는 객체다.
			//세션을 통하여 데이터를 해당 어플리케이션 내부에서 공유 가능하다.
			//해당 데이터는 페이지가 변경되거나 접속이 종료되어도 일정기간 보간되므로 다양한 용도로 사용이 가능
			//로그인이나 장바구니 등에 사용된다.
			//기본 저장 규격이 Object이다.
			
			String str="iot 융합 프로그래밍 학과에 오신 것을 환영합니다.";
			//세션에 데이터를 저장할 때는 session.setAttribute(key, value);로 저장한다.
			session.setAttribute("msg", str);
		%>
		<a href="data.jsp">다른 페이지로 이동하기</a>
	</body>
</html>