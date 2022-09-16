<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<title>반응형 기초</title>
		<style>
			div{
				border: 1px solid black; witdh:200px; height:100px;
			}
			.inline{
				display:inline;
			}
			.block{
				display:block;
			}
			.inline-block{
				display:inline-block;
			}
		</style>
	</head>
	<body>
		<!-- block태그 : 한줄을 모두 차지하는 태그, div p h2 면적을 준 경우는 나머지를 마진-->
		<!-- inline태그 : 한줄 내부에서 영향을 미치지 않고 자리잡는 태그, pan, 마진이 없다. margin : 0 auto가 의미 없다.-->
		<!-- inline-block 태그 : 면적과 마진을 가지면서도 한줄을 전부 차지하지 않는 태그 -->
		<p>iot 융합 <span>프로그래밍 학과</span>입니다.</p>
		<div class="inline">인라인</div>
		<div class="inline">인라인</div>
		<div class="inline">인라인</div>
		<!-- text노드 "/n/t가 들어가 있다." -->
		<div class="block">블락</div>
		<div class="block">블락</div>
		<div class="block">블락</div>
		<div class="inline-block">인라인-블락</div>
		<div class="inline-block">인라인-블락</div>
		<div class="inline-block">인라인-블락</div>
		<a href="res1.jsp">가변 레이아웃 기초</a><br>
	</body>
</html>