<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>사이트 관리페이지</title>
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
			
			String tint=request.getParameter("tint");
			String hue=request.getParameter("hue");
			String member=request.getParameter("member");
			String merchandise=request.getParameter("merchandise");
			String advertisement=request.getParameter("advertisement");
			String coding=request.getParameter("coding");
			String notice=request.getParameter("notice");
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url, db_id, db_pw);
				stmt=conn.createStatement();
				String sql="insert into test1(tint, hue, member, merchandise, advertisement, coding, notice)values('"+
				tint+"', '"+hue+"', '"+member+"', '"+merchandise+"', '"+advertisement+"', '"+coding+"', '"+notice+"');";
				//out.print(sql);
				boolean result=stmt.execute(sql);
				response.sendRedirect("index.jsp");	
				
			}catch(Exception e)
			{
				out.print("<h1>오류발생 : "+e+"</h>");
			}
		%>	
	</body>
</html>