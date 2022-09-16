<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>전송확인</title>
	</head>
	<body>
		<%
			//파스칼 표기법 : 각 문자의 앞문자를 대문자로 표기, class명 또는 자료형에 사용 String
			//카멜표기법 : 두번째 단어의 앞 문자부터 대문자로 표기, method명에 사용. .set Character Encodint()
			request.setCharacterEncoding("utf-8");
			String button = request.getParameter("button");
			String submit = request.getParameter("submit");
			//String checkbox=request.getParameter("checkbox");
			//String checkbox=request.getParameter("checkbox");
			//같은 name을 가진 input의 값들은 최초로 전송된 하나의 값만을 getParameter로 가져올 수 있다.
			
			String[] checkbox=request.getParameterValues("checkbox");
			//request.getParameterValues(String); : 같은 이름을 가진 input들로부터 전송된 데이터를 배열로 추출
			
			
			//특이 input들의 값 확인
			String color=request.getParameter("color");//input type="color" #FFFFF
			String date=request.getParameter("date");//input type="date"
			String datetime=request.getParameter("datetime");
			String range=request.getParameter("range");
		%>
		<h1>button으로부터 전송받은 값 : <%=button %></h1>
		<h1>submit으로부터 전송받은 값 : <%=submit %></h1>
		<%
			for(String str : checkbox)
			{
				%><h1>checkbox[]로부터 전송받은 값:<%=str%></h1><%
					
			}
		%>
		
		
		<%
			for(int i=0; i<checkbox.length; i++)
			{
				%><h1>checkbox[<%=i%>]로부터 전송받은 값 : = <%=checkbox[i] %></h1><%
			}
		%>
		<h1 style="color:<%=color%>;">color로부터 전송받은 값 : <%=color %></h1>
		<h1>date로부터 전송받은 값 : <%=date %></h1>
		<h1>datetime-local로부터 전송받은 값 : <%=datetime %></h1>
		<h1>range로부터 전송받은 값 : <%=range %></h1>
	</body>
</html>