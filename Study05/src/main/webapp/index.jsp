<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>반복처리</title>
	</head>
	<body>
		<%--
			String color="";
			for(int i=0; i<7; i++)
			{
				
				switch(i)
				case 0:--%>
					 <%-- color=%>"red">색상이 변동</p>
				
				<%case 1: %>
					<p<%  color=%>"orange">색상이 변동</p>
				
				<%case 2: %>
					<p <%  color=%>"yellow">색상이 변동</p>
				
				<%case 3: %>
					<p <%  color=%>"green">색상이 변동</p>
				
				<%case 4: %>
					<p <%  color=%>"blue">색상이 변동</p>
				
				<%case 5:%>
					<p <%  color=%>"black">>색상이 변동</p>	
				
				<%case 6:%>
					<p <% color=%>"purple">>색상이 변동</p>
			}
		
		--%>
		
		<%String color="";
		for (int i=1; i<8; i++)
		{
			switch(i){
			case 1:color="red"; break;
			case 2:color="orange"; break;
			case 3:color="yellow"; break;
			case 4:color="green"; break;
			case 5:color="blue"; break;
			case 6:color="indigo"; break;
			case 7:color="purple"; break;
			}
			%><h<%=i%> style="color:<%=color%>;">색상이 변동</h<%=i %>><%
			
			
		}
		%>	
	
	</body>
</html>