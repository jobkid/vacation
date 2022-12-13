<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>JSP 버전 확인</title>
	</head>
	<body>
		<%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion()  %>
		<%= application.getMajorVersion() %>.<%= application.getMinorVersion() %> 
		<%=application.getServerInfo() %>
	</body>
</html>