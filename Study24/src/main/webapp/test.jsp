<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>EL의 패러미터 확인법</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			//EL의 전송 역시도 request를 따라 이동하기 때문에 한글 깨짐을 수정하려면
			// 다음의 내용이 필요하다.
		%>
		<%=request.getParameter("user") %>
		<h1>${param }</h1>
		<h1>아이디 : ${param.user }</h1>
		<h1>비밀번호 : ${param.pw }</h1>
		<!-- 여러 개의 값이 오는 경우 처음에 찍힌 값만 보이는 것을 확인 -->
		<h1>선호하는 계절 : ${param.season }</h1>
		<%
			String[] season=request.getParameterValues("season");
			for(int i=0; i<season.length; i++){
				%><h1><%=season[i]%></h1><%
			}
		%>
		${paramValues.season}<br><!-- 배열로 들어가 있는 경우 -->
		${paramValues.season[0] }<br>
		${paramValues.season[1] }<br>
	</body>
</html>