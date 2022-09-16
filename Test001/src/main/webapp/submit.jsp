<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>데이터를 받아오는 부분</title>
	</head>
	<body>
		<%
			int tr=Integer.parseInt(request.getParameter("tr"));
		
			//String td=request.getParameter("td");
			int td=Integer.parseInt(request.getParameter("td"));
			
			String tdwidth=request.getParameter("tdwidth");
			String tdheight=request.getParameter("tdheight");
			String border=request.getParameter("border");
			String px=request.getParameter("px");
			String background=request.getParameter("background");
			
			String style="style='width:"+tdwidth+"px; height:"+tdheight+"px; border:"+px+"px solid "+border+
			"; background-color:"+background+";'";
			
		%>
		<!--  
		<div><%=style %>
		<p>tr수 : <%=tr %></p>
		<p>td수 : <%=td %></p>
		<p>너비 : <%=tdwidth %></p>
		<p>높이 : <%=tdheight %></p>
		<p>테두리색상 : <%=border %></p>
		<p>테두리두께 : <%=px %></p>
		<p>배경색상 : <%=background %></p>
		</div>-->
		
		<table>
		<%
			for(int i=0; i<tr; i++){
				%><tr><%
				for(int j=0; j<td; j++){
					%><td <%=style %>></td><%
				}
				 %></tr><%
			}%>
		</table>
		
	
	</body>
</html>