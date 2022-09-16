<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>미디어 쿼리의 속성</title>
		<style>
			/*
				유형
				all : 모든 경우에 사용
				print : 페이지 인쇄에 사용되는 경우
				screen : 화면을 표시할 때 사용되는 경우
				speech : 화면을 글로 읽는 경우
				
				max-width : 너비가 특정숫자를 최대치로 가지는 경우 실행, 해당 수보다 작은 경우 실행
				min-width : 너비가 특정숫자를 최소치로 가지는 경우 실행, 해당 수보다 큰 경우 실행
			*/
			@media screen and (width:500px){
				body{
					background-color:red;
				}
			}
			@media screen and (max-width:400px){
				body{
					background-color:blue;
				}
			}
			@media screen and (min-width:600px){
				body{
					background-color:green;
				}
			}
			/*
				orientation : 방향
				landscape : 가로
				portrait : 세로
			*/
			@media (orientation : landscape){
				body{
					background-color:black;
				}
			}
		</style>
	</head>
	<body>
		
	</body>
</html>