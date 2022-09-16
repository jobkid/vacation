<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>fadeToggle</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<p>클릭하여 페이드 토글 처리</p>
		<div id = "div1" style = "background-color:red; width:100px; height:100px; display:none;"></div>
		<div id = "div2" style = "background-color:blue; width:100px; height:100px; display:none;"></div>
		<div id = "div3" style = "background-color:green; width:100px; height:100px; display:none;"></div>
		<div id = "div4" style = "background-color:black; width:100px; height:100px; display:block;"></div>
		<script>
			$("p").click(function(){
				$('#div1').fadeToggle();
				$('#div2').fadeToggle("slow");
				$('#div3').fadeToggle(3000);
				$('#div4').fadeToggle(3000, function(){
					alert("동작완료");
				});
			});
			//fadeTo : 특정 투명도까지만 진행되는 fadeToggle
			//목적투명도 : 0~1 tkdldml xnaudeh rkqtdmf wlwjdgkf tn dlTek.
			//$(선택자).fadeTo(시간, 목적투명도, 변경 종료시 수행할 함수);
		</script>
	</body>
</html>