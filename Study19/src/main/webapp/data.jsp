<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.net.*" %>    
<div id="data">
	<%
		request.setCharacterEncoding("utf-8");
		String name1=request.getParameter("name");
		String name2=URLDecoder.decode(request.getParameter("name2"), "utf-8");
	%>
	<h1><%=name1 %>님 접속을 환영합니다.</h1>
	<h1><%=name2 %>님 접속을 환영합니다.</h1>
</div>