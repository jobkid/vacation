<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>사이트 관리 페이지</title>
		<style>
		#wrap{
			width:500px;
			margin:0 auto;
			border:5px solid red;
			padding:20px;
			background-color:white;
		}
		ul{
			padding:0;
			margin:0;
		}
		ul li{
			list-style:none;
			border:2px solid purple;
			text-align:center; 
			width:65px;
			display:inline-block;
		}
		ul li hover{
			background-color:black;
			color:white;
		}
		
		input[type="submit"]{
			diplay:block;
			margin:10px auto;
			
		}
		</style>
	</head>
	<body>
		<%
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
			
			String url="jdbc:mysql://127.0.0.1:3306/study";
			String db_id="root";
			String db_pw="iotiot";
			
			String color1=null;
			String color2=null;
			String menu1=null;
			String menu2=null;
			String menu3=null;
			String menu4=null;
			String notice=null;
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url, db_id, db_pw);
				stmt=conn.createStatement();
				String sql="select * from test1;";
				rs=stmt.executeQuery(sql);
				while(rs.next()){
					tint=rs.getString("tint");
					hue=rs.getString("hue");
					member=rs.getString("member");
					merchandise=rs.getString("merchandise");
					advertisement=rs.getString("advertisement");
					coding=rs.getString("coding");
					notice=rs.getString("notice");
					/*switch(data)
					{
					case "tint" : tint=data; break; 
					case "hue" : hue=data; break;
					case "member" : member=data; break;
					case "merchandise" : merchandise=data; break;
					case "advertisement" : advertisement=data; break; 
					case "coding" : coding=data; break;
					case "notice" : notice=data; break;
					}*/
					
					out.print("<h1>타입값 : "+tint+", 휴"+hue+"</h1>");
				}
			}catch(Exception e){
				out.print("<h1>오류발생 : "+e+"</h>");
			}
			conn.close();
		%>
		<div id="wrap">
			<h1><%=notice %></h1>
				<ul>
					<li><%=menu1 %></li><li><%=menu2 %></li><li><%=menu3 %></li><li><%=menu4 %></li>
				</ul>
				<form method="post" action="admin.jsp">
					<fieldset>
						<legend>배경색상관리</legend>
						<input type="color" vlaue="<%=color1 %>" name="bg">
					</fieldset>	
					<fieldset>
						<legend>전셩색상관리</legend>
						<input type="color" vlaue="<%=color2 %>" name="fg">
					</fieldset>
					<fieldset>
						<legend>메뉴명 변경</legend>
						<input type="text" value=<%=menu1 %> name="mn1">
						<input type="text" value=<%=menu2 %> name="mn2">
						<input type="text" value=<%=menu3 %> name="mn3">
						<input type="text" value=<%=menu4 %> name="mn4">
					</fieldset>
					<fieldset>
						<legend>안내문 관리</legend>
						<input type="text" name="nt" value="<%=notice%>">
					</fieldset>
					<div id="change">
						<input type="submit" value="변경">
					</div>
				</form>
		</div>
		<script>
			document.body.style.backgroundColor="<%=color1%>";
			document.getElementById("wrap").style.backgroundColor="<%=color2%>";
		</script>
	</body>
</html>