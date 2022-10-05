<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>삭제 처리기</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			String del=request.getParameter("num");
			Connection conn=null;
			Statement stmt=null;
			
			String url="jdbc:mysql://127.0.0.1:3306/study";
			String drive="com.mysql.cj.jdbc.Driver";
			String id="root";
			String pw="iotiot";
			
			try{
				Class.forName(drive);
				conn=DriverManager.getConnection(url, id, pw);
				stmt=conn.createStatement();
				
				String query="delete from student where num="+del+";";
				stmt.executeUpdate(query);
				
				response.sendRedirect("index.jsp");
			}catch(Exception e){
				out.print("<h1>delete.jsp에서 오류발생"+e+"<h1>");
			}finally{				
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}
		%>
	</body>
</html>