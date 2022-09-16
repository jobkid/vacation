<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>데이터 확인</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String subject=request.getParameter("subject");
		String jsp=request.getParameter("jsp");
		String android=request.getParameter("android");
	%>
	<table>
		<tr>
			<td>아이디</td><td><%=id %></td>
		</tr>
		<tr>
			<td>비밀번호</td><td><%=pass %></td>
		</tr>
		<tr><td>성명</td><td><%=name %></td></tr>
		<tr><td>전화번호</td><td><%=phone %></td></tr>
		<tr><td>관심분야</td><td><%=subject %></td></tr>
		<tr><td>jsp 수강여부</td><td><%=jsp %></td></tr>
		<tr><td>android 수강여부</td><td><%=android %></td></tr>
	</table>
	
	</body>
</html>