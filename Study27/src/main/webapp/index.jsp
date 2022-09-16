<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<title>자바빈과 jstl</title>
	</head>
	<body>
		<h1>자바방식</h1>
		<%
			beans.Student s1=new beans.Student();
			s1.setName("이진선");
			s1.setAge("19");
			s1.setAddress("서울시 강북구");
		%>
		<%=s1 %>
		<h1>액션태그 방식</h1>
		<jsp:useBean id="s2" class="beans.Student"></jsp:useBean>
		<jsp:setProperty name="s2" property="name" value="고희선"></jsp:setProperty>
		<jsp:setProperty name="s2" property="age" value="25"></jsp:setProperty>
		<jsp:setProperty name="s2" property="address" value="서울시 중구"></jsp:setProperty>
		<%=s2 %>
		
		<h1>jstl 방식</h1>
		<c:set var="s3" value="<%=new beans.Student() %>"></c:set>
		<c:set target="${s3 }" property="name" value="이영준"></c:set>
		<c:set target="${s3 }" property="age" value="30"></c:set>
		<c:set target="${s3 }" property="address" value="서울시 성북구"></c:set>
		${s3 }
	</body>
</html>