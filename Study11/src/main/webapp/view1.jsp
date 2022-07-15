<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>쿠키 값을 확인할 페이지</title>
	</head>
	<body>
		<%
		//쿠키는 respons가 먼저이다.	
		//쿠키는 여러 개가 저장되어 있을 수 있으므로 Cookie타입의 배열을 통해서 받아온다.
			Cookie[] cookies=request.getCookies();
		
		//쿠키가 총 몇개가 들어있는지 배열의 길이를 통하며 확인 가능
			int size=cookies.length;
		%>
		<h1>쿠키 값은 다음과 같습니다.</h1>
		<p>쿠키 값의 길이 : <%=size %></p>
		
		<%
			for(int i=0; i<cookies.length;i++)
			{
				%><p>쿠키 값의 이름 확인 : <%=cookies[i].getName()%></p><%
				%><p>쿠키 값의 내용 확인 : <%=cookies[i].getValue()%></p><%
			}
			
		%>
		<a href="view2.jsp">쿠키값 공유 확인하러 가기</a>
	</body>
</html>