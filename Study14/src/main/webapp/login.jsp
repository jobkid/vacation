<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>로그인 처리 페이지</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
		
			String adminId="admin"; //관리자 아이디
			String adminPass="1111";//관리자 비밀번호
			String userId="user";	//일반 유저 아이디
			String userPass="2222";	//일반유저 비밀번호
			
			
			String user=request.getParameter("user");
			String pw=request.getParameter("pw");
		

		if(user.equals(adminId) && pw.equals(adminPass))
		{
			session.setAttribute("grade", "관리자");
			response.sendRedirect("main.jsp");
		}
		else if(user.equals(userId) && pw.equals(userPass))
		{
			session.setAttribute("grade","일반회원");
			response.sendRedirect("main.jsp");
		}
		else
		{
			%><script>
				alert("로그인에 실패하였습니다.")
				
				//request의 전송초리
				location.href="index.jsp";
			</script><%
			
		}%>
		
	</body>
</html>