<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>회원 목록</title>
	</head>
	<body>
		<%
			String driver="com.mysql.cj.jdbc.Driver";
			String url="jdbc:mysql://127.0.0.1:3306/againstory";
			String myid="root";
			String mypw="iotiot";
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
			String query="select *from members;";
			String result="";
			
			
			try{
				Class.forName(driver);
				conn=DriverManager.getConnection(url, myid, mypw);
				stmt=conn.createStatement();
				rs=stmt.executeQuery(query);	
				
				while(rs.next()){
					result+="<tr><td>"+rs.getString("name")+"</td>";
					result+="<td>"+rs.getString("id")+"</td>";
					result+="<td>"+rs.getString("pwd")+"</td>";
					result+="<td>"+rs.getString("nickname")+"</td>";
					result+="<td>"+rs.getString("email")+"</td>";
					result+="<td>"+rs.getString("phone")+"</td>";
					result+="<td>"+rs.getString("birthday")+"</td>";
					result+="<td>"+rs.getString("place")+"</td>";
					result+="<td>"+rs.getString("joindate")+"</td></tr>";
				}
				
			}catch(ClassNotFoundException e){
				out.print("<h1> 오류 내용:"+e+" </h1>");
			}finally{
				if(rs!=null){
					rs.close();
				}
				if(stmt!=null){
					stmt.close();
				}
				if(conn!=null){
					conn.close();
				}
			}
		%>	
		
		<table border="1">
				<tr>
					<td>이름</td><td>아이디</td><td>비밀번호</td><td>닉네임</td><td>이메일</td><td>전화번호</td><td>생년월일</td><td>장소</td><td>가입일시</td>
				</tr>
				<%=result %>
		</table>
	</body>
</html>