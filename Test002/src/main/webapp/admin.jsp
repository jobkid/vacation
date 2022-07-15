<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>갱신 처리기</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			String bg=request.getParameter("bg");
			String fg=request.getParameter("fg");
			String tint=request.getParameter("tint");
			String hue=request.getParameter("hue");
			String merchandise=request.getParameter("merchandise");
			String member=request.getParameter("advertisement");
			String advertisement=request.getParameter("coding");
			String notice=request.getParameter("notice");
		
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String url="jdbc:mysql://127.0.0.1:3306/study";
		String db_id="root";
		String db_pw="iotiot";
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(url, db_id, db_pw);
			stmt=conn.createStatement();
			String sql="update test1 set data='"+bg+"' where type=background';";
			
			
		}catch(Exception e){
			out.print("<h1>오류발생 : "+e+"</h1>");
		}
		
		%>
		
		<h1><%=tint %></h1>
		<h1><%=hue %></h1>
		<h1><%=member %></h1>
		<h1><%=merchandise %></h1>
		<h1><%=advertisement %></h1>
		<h1><%=notice %></h1>
	</body>
</html>