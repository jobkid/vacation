<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>정보수정 처리기</title>
	</head>
	<body>
		<%
			Connection conn=null; //데이터 베이스 접속 회선
			Statement stmt=null; //회선을 따라 이동하며 query문과 resultset을 전달해줄 객체
			ResultSet rs=null;	//select문의 결과값을 담을 수 있는 타입.
			
			//데이터베이스 접속을 위한 패러미터들
			String url="jdbc:mysql://127.0.0.1:3306/study"; //"프로토콜 : //위치:포트번호/데이터베이스명"
			String db_id="root";//데이터베이스 접속주소
			String db_pw="iotiot";//데이터베이스 접속 비밀번호
			
			//post를 통해 edit.jsp파일에서 전송 받아올 패러미터들.
			request.setCharacterEncoding("utf-8");	//한글깨짐 방지
			String number=request.getParameter("number"); //primary key값
			String id=request.getParameter("id");//아이디값
			String pw=request.getParameter("pw");//비밀번호 값
			String name=request.getParameter("nm");//이름값
			String email=request.getParameter("em");//이메일 값
			String phone=request.getParameter("ph");//전화번호 값
			String address=request.getParameter("ad");//주소값
			
			String sql=null;
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url, db_id, db_pw);
				stmt=conn.createStatement();
				sql="update register set id='"+id+"', pass='"+pw+"', name='"+name+"', email='"+email+"', ";
				sql+="email='"+email+"', phone='"+phone+"', address='"+address+"' where num="+number+";";
				
				
				int result = stmt.executeUpdate(sql);
				//Statement.execute(String sql) : return boolean, query문의 동작여부를 반환, insert문에 사용
				//Statement.executeQuery(String query) : return ResultSet, 화면을 반환, select문에 사용
				//Statement.executeUpdate(String query) : return int, 영향을 받은 튜플의 수를 반환, update delete
				
				response.sendRedirect("member.jsp");
				
			}catch(Exception e){
				out.print("<h1>오류발생 : "+e+"</h1>");
			}
			%>
			<h1><%=sql %></h1>
		
		<h1><%=number %></h1><h1><%=id %></h1><h1><%=pw %></h1><h1><%=name %></h1><h1><%=email %></h1>
		<h1><%=phone %></h1><h1><%=address %></h1>
	</body>
</html>