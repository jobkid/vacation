<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>학사관리 프로그램</title>
		<style>
			#wrap{
				width:600px;
				border:10px solid lightgray;
				margin:0 auto;
			}
			#wrap2{
				width:600px;
				border:5px solid lightgray;
				margin:0 auto;
			}
			td{
				border:2px solid black;
				text-align:center;
				width:80px;
			}
			input{
				width:75px;
			}
			.yellow{
				background-color:yellow;
			}
		</style>
	</head>
	<body>
		<%
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
			String result=null;
			
			String url="jdbc:mysql://127.0.0.1:3306/study";
			String id="root";
			String pw="iotiot";
			String driver="com.mysql.cj.jdbc.Driver";
			
			try{
				Class.forName(driver);
				conn=DriverManager.getConnection(url, id, pw);
				stmt=conn.createStatement();
				String query="select *from student";
				rs=stmt.executeQuery(query);
				while(rs.next()){
					result="<tr>";
					result+="<form method='post' action='update.jsp'>";
					result+="<td><input type='text name='nm' value='"+rs.getString("name")+"'></td>";
					result+="<td><input type='text name='mt' value='"+rs.getString("math")+"'></td>";
					result+="<td><input type='text name='en' value='"+rs.getString("eng")+"'></td>";
					result+="<td><input type='text name='ko' value='"+rs.getString("kor")+"'></td>";
					result+="<td><input type='hidden' name='num' value='"+rs.getInt("num")+"'><input type='submit' value='수정'></td>";
					result+="</form></td>";
					result+="<td><form method='post' action='delete.jsp'><input type='hidden' name='num' value='"+rs.getString("num")+"'><input type='submit' value='삭제'>";
					result+="</form></td></tr>";
					
				}
				
			}catch(Exception e){
				out.print("<h1>오류발생 : "+e+"</h1>");
			}finally{
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}
		%>
		<div id="wrap">
			<form method="post" action="submit.jsp">
				<fieldset>
					<legend>학생 명단 출력</legend>
						<table>
							<tr>
								<td class="yellow">이름</td><td class="yellow">수학</td><td class="yellow">영어</td><td class="yellow">국어</td><td class="yellow">수정</td><td class="yellow">삭제</td>
								<%=result %>
							</tr>
							
							<!-- 
							<tr>
								<td><input name="name"></td><td><input name="math"></td><td><input name="eng"></td><td><input name="kor"></td><td><input type="submit" value="수정"></td><td><input type="submit" value="삭제"></td>
							</tr>
							<tr>
								<td><input name="name"></td><td><input name="math"></td><td><input name="eng"></td><td><input name="kor"></td><td><input type="submit" value="수정"></td><td><input type="submit" value="삭제"></td>
							</tr>
							<tr>
								<td><input name="name"></td><td><input name="math"></td><td><input name="eng"></td><td><input name="kor"></td><td><input type="submit" value="수정"></td><td><input type="submit" value="삭제"></td>
							</tr> -->
						</table>
				</fieldset>
			</form>
		</div>
		<div id="wrap2">
			<form method="post" action="input.jsp">
				<fieldset>
					<legend>학생성적입력</legend>
						<input name="name" placeholder="이름을 입력하세요.">
						<input name="math" placeholder="수학성적">
						<input name="eng" placeholder="영어성적">
						<input name="kor" placeholder="국어성적">
						<input type="submit" value="학생입력">
				</fieldset>
			</form>
		</div>
	</body>
</html>