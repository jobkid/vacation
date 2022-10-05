<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>입력처리기</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			String name=request.getParameter("name");
			String math=request.getParameter("math");
			String eng=request.getParameter("eng");
			String kor=request.getParameter("kor");		
	
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
				
				String query="insert into student (name, math, eng, kor)";
				query+="values('"+name+"', "+math+", "+eng+", "+kor+");";
				stmt.execute(query);
				//executeQuery : return ResultSet, select문에 사용.
				//execute : return boolean, insert문에 사용
				//executeUpdate : return int, delete 또는 update에 사용
						
				response.sendRedirect("index.jsp");
			}catch(Exception e){
				out.print("<h1>input.jsp에서 오류발생 : "+e+"</h1>");
			}finally{
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}
			
			
			
		%>
	</body>
</html>