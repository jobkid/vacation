<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jstl�� ���</title>
	</head>
	<body>
		<!-- Jsp Standard Tag Library -->
		<!-- jstl�� ����ϱ� ���ؼ��� taglib�� �ҷ��;� �Ѵ�. -->
		<!-- uri : �����ĺ���, ���ͳݿ� �����ϴ� �� �ڷ���� ������ id 
		uriform resource identifier -->
		<!-- url:��ġ, ����Ʈ�� �����ΰ� ���� ��ġ�� ǥ�� -->
		<!-- urn : ��Ī, �ش� �ڷ��� �̸� -->
		
		<!-- �⺻��� ::c:: http://java.sun.com/jsp/jstl/core-->
		<!-- ���ĺ��� ::fmt:: http://java.sun.com/jsp/jstl/fmt -->
		<!-- DB���� ::sql:: http://java.sum.com/jsp/jstl/sql -->
		<!-- XML���� ::xml:: http://java.sun.com/jsp/jstl/xml -->
		<!-- �Լ�ó�� :: fn:: http://java.sun.com/jsp/jstl/fn -->
		
		<!-- c:out ���� ����ϴ� ��� -->
		<c:out value="jstl���"></c:out><br>
		${"EL���" }<br>
		<%="script ���" %><br>
		<%out.print("java���"); %><br>
		
		<!-- c:set �Ӽ��� ���� �����ϴ� ��� -->
		<%pageContext.setAttribute("test", "java�� ������ ������"); %>
		<c:set var="test2" value="jstl�� ������ ������"></c:set>
		${test }<br>
		${test2 }<br>
		<c:set var="number">30</c:set>
		${number }
		
		<a href="test.jsp">EL�� jstlȮ��</a>
	</body>
</html>