<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jstl의 사용</title>
	</head>
	<body>
		<!-- Jsp Standard Tag Library -->
		<!-- jstl을 사용하기 위해서는 taglib을 불러와야 한다. -->
		<!-- uri : 고유식별자, 인터넷에 존재하는 각 자료들의 고유값 id 
		uriform resource identifier -->
		<!-- url:위치, 사이트의 도메인과 같이 위치를 표기 -->
		<!-- urn : 명칭, 해당 자료의 이름 -->
		
		<!-- 기본기능 ::c:: http://java.sun.com/jsp/jstl/core-->
		<!-- 형식변경 ::fmt:: http://java.sun.com/jsp/jstl/fmt -->
		<!-- DB조작 ::sql:: http://java.sum.com/jsp/jstl/sql -->
		<!-- XML조작 ::xml:: http://java.sun.com/jsp/jstl/xml -->
		<!-- 함수처리 :: fn:: http://java.sun.com/jsp/jstl/fn -->
		
		<!-- c:out 값을 출력하는 기능 -->
		<c:out value="jstl출력"></c:out><br>
		${"EL출력" }<br>
		<%="script 출력" %><br>
		<%out.print("java출력"); %><br>
		
		<!-- c:set 속성에 값을 저장하는 기능 -->
		<%pageContext.setAttribute("test", "java로 저장한 데이터"); %>
		<c:set var="test2" value="jstl로 저장한 데이터"></c:set>
		${test }<br>
		${test2 }<br>
		<c:set var="number">30</c:set>
		${number }
		
		<a href="test.jsp">EL과 jstl확인</a>
	</body>
</html>