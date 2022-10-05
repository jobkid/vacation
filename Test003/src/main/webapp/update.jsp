<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>수정 처리기</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			String name=request.getParameter("nm");
			String math=request.getParameter("mt");
			String eng=request.getParameter("en");
			String kor=request.getParameter("ko");
			String num=request.getParameter("num");
			
			Connection conn=null;
			Statement stmt=null;
			
			String url="jdbc:mysql://127.0.0.1:3306/study";
			String db_id="root";
			String db_pw="iotiot";
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url, db_id, db_pw);
				stmt=conn.createStatement();
				
				String query="update student set num="+num+", name='"+name+"', math="+math+", eng="+eng+", kor="+kor+"where num="+num+";";
				stmt.executeUpdate(query);
				response.sendRedirect("index.jsp");
			}catch(Exception e){
				out.print("<h1>수정 작업 중 오류 발생 : "+e+"</h1>");
			}finally{
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}
		%>
	</body>
</html>