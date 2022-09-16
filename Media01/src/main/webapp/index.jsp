<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>미디어쿼리</title>
		<!-- heigt주지말고 width만 -->
		<style>
			/*
				@media 선택 유형 논리연산(조건){
					선택자{
						변경할 내용
					}
				}
				// 선택 : 적용할 레이아웃을 가진 장비의 범위선택, only | not, 기본값only
				//유형 : 해당 미디어쿼리를 적용할 장비의 종류, 프린터, 스마트폰, 그로젝터 모니터 등등;;
				논리연산 : and, (&& ||)
				조건 : 해당 조건이 true인 경우 미디어쿼리 내부의 CSS코드를 실행
				
				min-width 스마트폰 폴더블 테블릿 순서로 개발할 때.
				max-width 기존 웹사이트를 테블릿 스마트폰으로 유지 보수 할때
				
			*/
			@media all and (min-width:320px){
				body{
					background-color:red;
				}
			}
			@media all and (min-width:768px){
				body{
					background-color : green;
				}
				h1{
					color:orange;
				}
			}
			@media all and (min-width:960px){
				body{
					background-color:black;
					color:white;
				}
				h1{
					color:white;
				}
			}
		</style>
	</head>
	<body>
		<h1>학과 소개</h1>
		<p>iot융합 프로그래밍 학과</p>
		<p>아두이노와 라즈베리파이를 활용한 하드웨어를 C , Python 프로그래밍으로 제어하는 기술을 익히고, JAVA, Android를 습득하여 스마트기기의 앱을 개발하여 사물인터넷 하드웨어와 통신하여 제어, 응용하는 기술을 배우는 학과</p>
	</body>
</html>