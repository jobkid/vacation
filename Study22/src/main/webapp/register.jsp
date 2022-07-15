<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>내용 확인 페이지</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			
		
			/*
			String name=request.getParameter("name");
			String userId=request.getParameter("id");
			String pass=request.getParameter("pass");
			String email=request.getParameter("email");
			String phone=request.getParameter("first")+request.getParameter("second")+
			request.getParameter("third");
			*/
		%>
		<jsp:useBean id="r" class="beans.Reg"></jsp:useBean>
		<jsp:setProperty name="r" property="*"></jsp:setProperty><!-- 태그처럼 생겼짐반 브라우저 HTML에 보이지 않는다. -->
		
		<h1>전송받은 데이터</h1>
		<p>이름 : <%=r.getName() %></p>
		<p>아이디 : <jsp:getProperty name="r" property="userId"></jsp:getProperty></p>
		<p>비밀번호 : <jsp:getProperty name="r" property="pass"></jsp:getProperty></p>
		<p>이메일 : <jsp:getProperty name="r" property="email"></jsp:getProperty></p>
		<p>폰번호 : <%=r.getPhone() %></p>
	</body>
</html>