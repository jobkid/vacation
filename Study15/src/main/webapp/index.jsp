<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>데이터베이스 연결 테스트</title>
	</head>
	<body>
		<%
			Connection conn=null;
			Statement stmt=null;
			try{
				String url="jdbc:mysql://127.0.0.1:3306/study";
				String id="root";
				String pass="iotiot";
				
				//Class.forName("com.mysql.jdbc.Driver"); mysql 5.~ 방식
				Class.forName("com.mysql.cj.jdbc.Driver"); //mySql 8.~방식
				
				conn=DriverManager.getConnection(url,id,pass);
				stmt=conn.createStatement();//SQL을 전달해줄 Statement는 Connection을 통하여 제작한다.
				
				String query="select*from register;";
				ResultSet rs=stmt.executeQuery(query);
				
				out.print("<table>");
				
				out.print(rs);
				
				out.print("<h1>정상 접속 확인</h1>");
				
			
				
				while(rs.next())
				{
					out.print("<tr>");
					
					String unum=rs.getString("num");
					String uid=rs.getString("id");
					String upass=rs.getString("pass");
					String uname=rs.getString("name");
					String uemail=rs.getString("phone");
					String uaddress=rs.getString("address");
					
					out.print("<td style='border: 1px solid red;'>"+unum+"</td>");
					out.print("<td style='border: 1px solid blue;'>"+uid+"</td>");
					out.print("<td style='border: 1px solid yellow;'>"+upass+"</td>");
					out.print("<td style='border: 1px solid black;'>"+uname+"</td>");
					out.print("<td style='border: 1px solid black;'>"+uemail+"</td>");
					out.print("<td style='border: 1px solid black;'>"+uaddress+"</td>");
					
					out.print("</tr>");
				}
				out.print("</table>");
				
			}catch(Exception e){
				out.print("<h1>오류발생 : "+e+"<h1>");
			}
		%>
	</body>
</html>