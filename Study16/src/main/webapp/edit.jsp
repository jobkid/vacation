<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>회원정보 수정 페이지</title>
		<style>
		#wrap{
			margin:50px auto; width:600px; padding:50px; border:10px solid lightgray;
		}
		
		td, th{
			border: 1px solid blue; padding:10px; text-align:center;
		}
		span{display:inline-block; width:145px; text-align:right;}
		</style>
	</head>
	<body>
		<%
			Connection conn=null; //mysql과 java를 연결할 회선
			Statement stmt=null;	//회선 사이를 오가면서 query를 전달해줄 상태값
			ResultSet rs=null;	//select의 결과물을 전송받아 저장할 규격
			String url="jdbc:mysql://127.0.0.1:3306/study";
			String db_id="root";
			String db_pw="iotiot";

			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url, db_id, db_pw);
				stmt=conn.createStatement();
				String sql="select *from register;";
				rs=stmt.executeQuery(sql);
				
				%><<div id="wrap">
					<table>
						<tr>
							<th>회원번호</th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>이메일</th>
							<th>연락처</th>
							<th>주소</th>
						</tr><%
						
				while(rs.next())
				{
					String num=rs.getString("num");
					String id=rs.getString("id");
					String pass=rs.getString("pass");
					String name=rs.getString("name");
					String email=rs.getString("email");
					String phone=rs.getString("phone");
					String address=rs.getString("address");
					
					%><tr>
						<td><%=num%></td>
						<td><%=id%></td>
						<td><%=pass%></td>
						<td><%=name%></td>
						<td><%=email%></td>
						<td><%=phone%></td>
						<td><%=address%></td>
					
					</tr>,<% 
				}
				%></table>
						<form method="post" action="update.jsp">
							변경하실 회원의 번호를 입력해 주세요. : <input type="text" name="number">
							<fieldset>
								<legend>수정사항 입력</legend>
								<span>회원 아이디 변경</span><input type="text" name="id"><br>
								<span>회원 비밀번호 변경</span><input type="text" name="pw"><br>
								<span>회원 이름 변경</span><input type="text" name="nm"><br>								
								<span>회원 이메일 변경</span><input type="text" name="em"><br>
								<span>회원 연락처 변경</span><input type="text" name="ph"><br>
								<span>회원 주소 변경</span><input type="text" name="ad"><br>
							</fieldset>
							<input type="submit" value="변경">
						</form>
				</div><%	
				
			}catch(Exception e)
			{
				out.print("<h1>오류발생 : "+e+"</h1>");
			}
		
		%>

	</body>
</html>