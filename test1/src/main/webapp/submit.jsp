<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>전송 확인</title>
		<style>
	
		</style>
	</head>
	<body>
		<%
		request.setCharacterEncoding("utf-8");
		String trnum=request.getParameter("trnum");
		String tdnum=request.getParameter("tdnum");
		String width=request.getParameter("width");
		String height=request.getParameter("height");
		
		String bodercolor=request.getParameter("bodercolor");
		String thickness=request.getParameter("thickness");
		String backcolor=request.getParameter("backcolor");
		
		int trnum2=Integer.parseInt(trnum);
		int tdnum2=Integer.parseInt(tdnum);
		int width2=Integer.parseInt(width);
		int height2=Integer.parseInt(height);
		int thickness2=Integer.parseInt(thickness);
		
		
		%><table><%
		for(int i=0; i<trnum2; i++)
		{	
			%><tr style=""><%
			for(int j=0; j<tdnum2; j++)
			{
				%><td></td><%
			}%>
			</tr><%
		}
		%>
		</table>

	</body>
</html>