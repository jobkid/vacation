<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>캔버스 이벤트 충돌처리</title>
		<style>
			canvas{/**/
				border : 1px solid gray;
			}
		</style>
	</head>
	<body>
		<canvas id="can">
		
		</canvas>
		<script>
			var canvas=document.getElementById("can");
			var ctx=canvas.getContext("2d");
			canvas.width=600;
			canvas.height=600;
			// 막대기 좌표변경을 위한 변수들
			var barx = 10;
			var barVx = 7;	//막대기 이동속도, 1회 갱신 시 이동하는 좌표값
			var bary = 550;
			
			//키보드를 좌표를 움직여주는 부분
			window.addEventListener("keydown", movBar);
			
			//키보드가 눌렸을 때 실행될 함수;
			function movBar(e){
				var code=e.keyCode;
				if(code==39){//오른쪽 화살표가 눌린 경우
					barx += barVx;	//오른쪽으로 한 단위 이동, x좌표값 증가
				}else if(code==37){
					barx -= barVx;
				}
				drawBar()
			}
			
			
			//막대기를 그려주는 함수
			function drawBar(){
				//ctx.beginPath();	//그림그리기 시작점
				//ctx.clearRect(0, 0, canvas.width, canvas.height);
				ctx.rect(barx, bary, 100, 20);	//사각형(시작x좌표, 시작y좌표, 너비, 높이)
				//ctx.fillStyle = "green";
				//ctx.fill();
				//ctx.closePath();	//그림그리기 종료지점
			};
			drawBar()
			
			//공의 좌표
			var ballx = 20;
			var ballVx = 1;
			var bally = 20;
			var ballVy = 3;
			
			//공 움직임 구현 함수
			setInterval(mov, 10);
			function mov(){
				ctx.beginPath();
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				ctx.arc(ballx, bally, 20, 0, Math.PI*2, true);
				//arc(중심 x좌표, 중심 y좌표, 반지름, 시작각도, 종료각도, 반시계방향 여부)
				ctx.fillStyle = "red";
				ctx.fill();
				ctx.closePath();
				
				//공이 이동하면서 한번씩 막대기도 그려주도록 변경
				ctx.beginPath();
				drawBar();
				ctx.fillStyle = "blue";
				ctx.fill();
				ctx.closePath();
				
				//공 좌표값 변동
				ballx += ballVx;
				bally += ballVy;
				
				//충돌체크
				if(bally > canvas.height-20 || bally < 0+20){
					ballVy *= -1;
				}if(ballx > canvas.width-20 || ballx < 0+20){
					ballVx *= -1;
				}
				//작대기 충돌 판정
				if(ballx>=barx && ballx <= barx + 100 && bally>bary-20){
					ballVy *= -1;
				}
				
			}
			mov();
		</script>
	</body>
</html>