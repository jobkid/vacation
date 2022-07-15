<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jstl fmt 사용</title>
	</head>
	<body>
		<c:set var="num" value="1000000" scope="page"></c:set>
		<p>${num }</p>
		fmt:number : <fmt:formatNumber value="${num }" type="number"></fmt:formatNumber><br>
		fmt:구분기호없음 : <fmt:formatNumber value="${num }" type="number" groupingUsed="false"></fmt:formatNumber><br>
		fmt:percent : <fmt:formatNumber value="0.5" type="percent"></fmt:formatNumber><br>
		fmt:currency : <fmt:formatNumber value="5000" type="currency"></fmt:formatNumber>원<br>
		fmt:통화기호변경 : <fmt:formatNumber value="5000" type="currency" currencySymbol="$"></fmt:formatNumber><br>
		fmt:패턴표기 : <fmt:formatNumber value="1234.5678" pattern="0.0#"></fmt:formatNumber><br>
		<!-- 0.0# : 0은 자릿수를 의미, #빈공간인 경우는 작성하지 않겠다. -->
		
		fmt:패턴표기 : <fmt:formatNumber value="1234.5678" pattern="0,00"></fmt:formatNumber><br>
		fmt:패턴표기 : <fmt:formatNumber value="1234.5678" pattern="0,0.00#"></fmt:formatNumber><br>
		fmt:패턴표기 : <fmt:formatNumber value="1234.5678" pattern="0,000.0#"></fmt:formatNumber><br>
		fmt:패턴표기 : <fmt:formatNumber value="1234.5678" pattern="000000,000.000000"></fmt:formatNumber><br>
		
		<!-- 0,00: 두 자리마다 ,로 구분기호를 넣어준다는 뜻 -->
		<!-- 0,0.00# : 모든 숫자를 ,로 구별하며 소수점은 3자리까지 작성 -->
		<!-- 0,000.0# : 천단위 구분기호를 사용하고 소수점은 2자리까지 작성 -->
		<!-- 000000,000.000000 -->
		<br>
		<hr>
		<c:set var="date" value="<%=new java.util.Date() %>" scope="page"></c:set>
		\${date } : ${date }<br>
		fmt : formatDate : <fmt:formatDate value="${date }"></fmt:formatDate><br>
		fmt : time : <fmt:formatDate value="${date }" type="time"></fmt:formatDate><br>
		fmt : both : <fmt:formatDate value="${date }" type="both"></fmt:formatDate><br>
		fmt : pattern : <fmt:formatDate value="${date }" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"></fmt:formatDate><br>
		<a href="Locale.jsp">기본 언어 설정 확인</a>
	</body>
</html>