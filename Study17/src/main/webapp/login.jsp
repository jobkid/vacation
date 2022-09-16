<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>로그인 처리기</title>
	</head>
	<body>
		<%
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
			String url="jdbc:mysql://127.0.0.1:3306/study";
			String db_id="root";
			String db_pw="iotiot";
			
			request.setCharacterEncoding("utf-8");
			String id=request.getParameter("id");
			String pw=request.getParameter("pass");
		
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url, db_id, db_pw);
				stmt=conn.createStatement();
				String sql="select * from register where id='"+id+"';";
				rs=stmt.executeQuery(sql);
				
				rs.next();
				String num=rs.getString("num");
				String name=rs.getString("name");
				String email=rs.getString("email");
				
				session.setAttribute("num", num);
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				session.setAttribute("login", true);
				
				out.print("<h1>이름 :"+name+", 이메일 : "+email+"</h1>");
			}catch(Exception e)
			{
				out.print("<h1>오류발생 : "+e+"</h1>");
			}
			//conn.close();
			//response.sendRedirect("index.jsp");
		
		%>
		
		<h1><%=id %></h1>
		<h1><%=pw %></h1>
	</body>
</html>