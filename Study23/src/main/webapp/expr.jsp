<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 앞에 \를 붙이면 EL을 화면에 출력할 수 있다. -->
		\${1+2 } : ${1+2}<br>
		\${3-4 } : ${3-4 }<br>
		\${5*6 } : ${5*6 }<br>
		\${7/8 } : ${7/8 }<br>
		\${9%10 } : ${9%10 }<br>
		\${11 div 12 } : ${11 div 12}<br><!-- 나누기 -->
		\${13 mod 14 } : ${13 mod 14 }<br><!-- 나머지 -->
		<hr>
		<!-- 관계연산 -->
		\${1==2 } : ${1==2 }<br>
		\${1 eq 2} : ${1 eq 2 }<br>
		\${3!=4 } : ${3!=4 }<br>
		\${3 ne 4 } : ${3 ne 4 }<br>
		\${5<6 } : ${5<6 }<br>
		\${5 lt 6 } : ${5 lt 6 }<br>
		\${7>8 } : ${7>8 }<br>
		\${7 gt 8} : ${7 gt 8 }<br>
		\${9<=10 } : ${9<=10 }<br>
		\${9 le 10 } : ${9 le 10 }<br>
		\${11>=12 } : ${11>=12 }<br>
		\${11 ge 12 } : ${11 ge 12 }<br>
		<hr>
		<!-- 논리연산 -->
		\${true && false } : ${true && false }<br>
		\${true || false } : ${true ||false }<br>
		\${!true } : ${!true }<br>
		<!-- null 확인연산 -->
		\${empty null } : ${empty null }<br>
		<!-- EL -->
	</body>
</html>