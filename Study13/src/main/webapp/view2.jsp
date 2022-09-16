<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>공유된 세션데이터 확인</title>
	</head>
	<body>
		<%
			String str=(String)session.getAttribute("key");
			//세션이 생성된 시간
			long time=session.getCreationTime();
			
			//클라이언트에서 세션을 마지막으로 사용한 시간
			long last=session.getLastAccessedTime();
			
			//세션이 활동할 수 있는 기간
			session.setMaxInactiveInterval(60*60);
			
			//세션의 활동 시간 확인
			int interval=session.getMaxInactiveInterval();
			
			//세션 삭제 처리
			session.invalidate();
		%>
		<p>세션에 저장된 정보 : <%=str %></p>
		<p>세션 생성 시간 : <%=time %></p>
		<p>세션 최종 사용 시간 : <%=last %></p>
		<p>세션 사용 가능 시간 : <%=interval %></p>
	</body>
</html>