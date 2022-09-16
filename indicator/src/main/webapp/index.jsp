<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>스크롤 인디케이터</title>
		<style>
			*{
				margin:0;
				padding:0;
			}
			#header{
				position : fixed;
				top:0;
				width:100%;
				background-color:red;
			}
			#header h1{
				margin:20px;
				text-align:center;
				color:white;
			}
			#content{
				padding:20px;
				padding-top:110px;
			}
			#bar{
				background-color:black;
				height:25px;
				width : 50%;
			}
		</style>
	</head>
	<body>
		<div id = "header">
			<h1>인디케이터</h1>
			<div id="bar"></div>
		</div>
		<div id = "content">
			<p><h1>근로조건의 기준은 인간의 존엄성을 보장하도록 법률로 정한다.</h1></p>
			<p><h1> 국회의원은 법률이 정하는 직을 겸할 수 없다. 국무총리는 국회의 동의를 얻어 대통령이 임명한다.</h1></p>
			<p><h1>대통령은 조국의 평화적 통일을 위한 성실한 의무를 진다.</h1></p>
			<p><h1>국가는 주택개발정책등을 통하여 모든 국민이 쾌적한 주거생활을 할 수 있도록 노력하여야 한다.</h1></p>
			<p><h1>국회의원은 현행범인인 경우를 제외하고는 회기중 국회의 동의없이 체포 또는 구금되지 아니한다.</h1></p>
			<p><h1>국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다.</h1></p>
			<p><h1>국채를 모집하거나 예산외에 국가의 부담이 될 계약을 체결하려 할 때에는 정부는 미리 국회의 의결을 얻어야 한다.</h1></p>
			<p><h1>국토와 자원은 국가의 보호를 받으며, 국가는 그 균형있는 개발과 이용을 위하여 필요한 계획을 수립한다.</h1></p>
			<p><h1>국가는 모성의 보호를 위하여 노력하여야 한다. 대통령은 국회에 출석하여 발언하거나 서한으로 의견을 표시할 수 있다. 의무교육은 무상으로 한다.</h1></p>
			<p><h1>국회는 법률에 저촉되지 아니하는 범위안에서 의사와 내부규율에 관한 규칙을 제정할 수 있다.</h1></p>
			<p><h1>누구든지 체포 또는 구속을 당한 때에는 적부의 심사를 법원에 청구할 권리를 가진다.</h1></p>
			<p><h1>국가는 여자의 복지와 권익의 향상을 위하여 노력하여야 한다.</h1></p>
			<p><h1>공공필요에 의한 재산권의 수용·사용 또는 제한 및 그에 대한 보상은 법률로써 하되, 정당한 보상을 지급하여야 한다.</h1></p>
			<p><h1>국민의 자유와 권리는 헌법에 열거되지 아니한 이유로 경시되지 아니한다. 각급 선거관리위원회의 조직·직무범위 기타 필요한 사항은 법률로 정한다.</h1></p>
			국회의원은 그 지위를 남용하여 국가·공공단체 또는 기업체와의 계약이나 그 처분에 의하여 재산상의 권리·이익 또는 직위를 취득하거나 타인을 위하여 그 취득을 알선할 수 없다. 정기회의 회기는 100일을, 임시회의 회기는 30일을 초과할 수 없다. 공무원인 근로자는 법률이 정하는 자에 한하여 단결권·단체교섭권 및 단체행동권을 가진다. 대통령은 필요하다고 인정할 때에는 외교·국방·통일 기타 국가안위에 관한 중요정책을 국민투표에 붙일 수 있다.</p>
			<p>국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는 대통령은 이를 해제하여야 한다. 대통령은 제4항과 제5항의 규정에 의하여 확정된 법률을 지체없이 공포하여야 한다. 제5항에 의하여 법률이 확정된 후 또는 제4항에 의한 확정법률이 정부에 이송된 후 5일 이내에 대통령이 공포하지 아니할 때에는 국회의장이 이를 공포한다. 대한민국의 영토는 한반도와 그 부속도서로 한다. 대통령은 국가의 독립·영토의 보전·국가의 계속성과 헌법을 수호할 책무를 진다. 모든 국민은 건강하고 쾌적한 환경에서 생활할 권리를 가지며, 국가와 국민은 환경보전을 위하여 노력하여야 한다. 법원은 최고법원인 대법원과 각급법원으로 조직된다.</p>
			<p>대통령은 법률이 정하는 바에 의하여 사면·감형 또는 복권을 명할 수 있다. 제안된 헌법개정안은 대통령이 20일 이상의 기간 이를 공고하여야 한다. 외국인은 국제법과 조약이 정하는 바에 의하여 그 지위가 보장된다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 모든 국민은 거주·이전의 자유를 가진다. 국가는 국민 모두의 생산 및 생활의 기반이 되는 국토의 효율적이고 균형있는 이용·개발과 보전을 위하여 법률이 정하는 바에 의하여 그에 관한 필요한 제한과 의무를 과할 수 있다. 국가는 지역간의 균형있는 발전을 위하여 지역경제를 육성할 의무를 진다. 국가안전보장회의는 대통령이 주재한다.</p>
		</div>
		<script>
			//스크롤 이벤트는 DOM이 아니라 BOM에서 동작하므로
			window.onscroll=function(){
				test();
			};
			function test(){
				var winScroll = document.documentElement.scrollTop;
				//scrollTop : 스크롤바가 상단과 얼마나 떨어져 있는지.
				//scrollHeight : 문서 전체의 길이
				//clientHeight : 스크롤바 내부 사각형의 길이
				/*
				console.log("상단과의 스크롤바 거리 : "+winScroll);
				var height = document.documentElement.scrollHeight;
				
				console.log("문서 전체의 길이 : "+height)
				var barSize = document.documentElement.clientHeight;
				
				console.log("스크롤바 내부 사각형의 길이 : "+barSize);
				*/
				
				var height = document.documentElement.scrollHeight-document.documentElement.clientHeight;
				//스크롤바가 실재로 이동할 수 있는 면적(100% 계산 기준점)
				console.log((winScroll/height)*100);
				var scroll = (winScroll/height)*100;
				document.getElementById("bar").style.width = scroll+"%";
				//console.log(document);선언구까지 나옴 	document Node타입
				//console.log(document.documentElement);Element Node타입
			}
		</script>
	</body>
</html>