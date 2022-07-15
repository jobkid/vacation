<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>로그인</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			//원래는 데이터베이스에서 조회 처리를 진행해야 하지만 강제로 테스트용 데이터를 넣어서 확인
			
			String user="admin";
			String pw="1111";
			
			String id=request.getParameter("id");	//사용자가 입력한 id
			String pass=request.getParameter("pass");//사용자가 입력한 비밀번호
		%>
		
		<%
			if(user.equals(id)&&pw.equals(pass))
			{
				response.sendRedirect("main.jsp");
				//외부로 보여줄 화면 데이터를 송출하기 때문에 response를 통한다.
				session.setAttribute("login", "로그인 성공");
				%><h1>로그인에 성공했습니다.</h1><%
			} 
			else
			{
				%><h1>로그인에 실패했습니다.</h1>
				<a href="index.jsp">로그인 페이지로 돌아가기</a><%
			}
		
		%>
		
		<h1><%=id %>,<%=pass %></h1>
	</body>
</html>