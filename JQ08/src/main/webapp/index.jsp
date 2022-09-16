<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>jQuery Fade</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<p>클릭하여 페이드 처리</p>
		<h1 style="display:none;">이 문장을 나타나게 합니다.</h1>
		<h2 style="display:none;">이 문장은 더 느리게 나타납니다.</h2>
		<h3 style="display:none;">완료된 이후 함수를 실행합니다.</h3>
		<div style="background-color:red; width:100px; height:100px; display:none;"></div>
		<script>
			//fade : 서서히 나타나는 효과
			//$(선태자).fadeIn(시간, 종료 시 수행할 함수);
		/*$("p").click(function (){
			$("h1").fadeIn();
			$("div").fadeIn("slow");
			$("h2").fadeIn(5000);	//style.opacity 값이 0~1로 변동하고 있음을 확인
			//매개변수에 들어가는 숫자는 int/1000초 동안 해당 동작을 마무리하도록 하고 있다.
			$("h3").fadeIn(5000, function(){
				alert("동작완료");
			});
		});*/
		
		//javascript 이용한 fade처리
		document.getElementsByTagName("p")[0].addEventListener("click", function(){
			var div = document.getElementsByTagName("div")[0];
			fadeIn(div, 5000);
		});
		function fadeIn(target, time){
			if(!target){
				return;
			}
			target.style.opacity=0;//해당 타겟을 완전 투명으로 변경
			target.style.filter="alpha(opacity=0)"; //가시 투평필터도 투명으로 변경
			target.style.display="block";
			target.style.visibility="visible";//눈에 보이지 않는 원인이 hidden이 아니도록 수정
			if(time){
				var opacity=0;	//0~1까지 변동할 값을 저장할 변수
				var time=setInterval(function(){
					opacity+=(50/time);	//0.01씩 투명도를 조절하겠다.
					if(opacity>=1){
						clearInterval(timer);
						opacity=1;
					}
					target.style.opacity=opacity;
					target.style.filter="alpha(opacity="+opacity*100+")";//alpha값은 100이 최대값
				}, 50);
			}else{
				target.style.opacity=1;
				target.style.filter="alpha(opacity=1)";
			}
		}
		
		
		</script>
	</body>
</html>