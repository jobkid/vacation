<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>스크립트릿의 활용</title>
	</head>
	<body>
		<p></p>
		<%
			int number=-1;
			if(number>0){
				
			
		%>
		<p><%=number %>는 양수입니다.</p>
		<%
			}else{
		%>
		<p><%=number %>는 음수입니다.</p>
		<%
			}
		%>
		
		
		
		<%
			if(number>0){
		%>
		<p><%=number%>는 양수입니다.</p>
		<%
			}else{
		
		%>
		<p><%=number%>는 음수입니다.</p>
		<% 
			}
		%>
		
		<%
			for(int i=1; i<7; i++){
				%><h<%=i%>>문자의 크기가 변동됩니다.</h<%=i%>><% 
			}
		%>
		
		
	</body>
</html>