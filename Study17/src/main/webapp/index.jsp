<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>메인페이지</title>
		<style>
			#wrap{
				width:800px;
				margin:0 auto;
				border:10px solid lightgray;
			}
			h1{
				margin:0;
				padding:0;
				width:100%;
				background-color:black;
				color:white;
			}
			#menu ul{
				padding:0;
				margin:0;
			}
			#wrap ul li{
				float:left;
				border:2px solid purple;
				padding:14px;
				text-align:center;
				list-style:none;
				width:21%
			}
			#wrap ul li:hover{
				background-color:black;
				color:white;
			}
			#wrap ul:after{
				content:"";
				display:block;
				clear:both;
			}
			#tab{
				border:2px solid black;
				width:216px;
				float:right;
				overflow:hidden;
			}
			#kid{
				width:579px;
			}
			#wrap:after{
				content:"";
				display:block;
				clear:both;
			}
			#tab input[type="submit"]{
				width:100px;
			}
		</style>
	</head>
	<body>
		<%
			String num=null;
			String name=null;
			String email=null;
			boolean login=false;
			if(session.getAttribute("login")!=null)
			{
				login=(boolean)session.getAttribute("login");
				num=(String)session.getAttribute("num");
				name=(String)session.getAttribute("name");
				email=(String)session.getAttribute("email");
			}
		%>
		<div id="wrap">
			<h1>테스트 사이트입니다.</h1>
			<div id="menu">
				<ul>
					<li>메인페이지</li>
					<li>회원목록</li>
					<li>상품목록</li>
					<li>상품입력</li>
				</ul>
			</div>
			<img id="kid" src="image/captainkid.jpg">
			<div id="tab">
			<%
				if(!login){	
			%>
				<form method="post" action="login.jsp">
					아이디<input type="text" name="id"><br>
					비밀번호<input type="password" name="pass"><br>
					<input type="submit" value="로그인!">
				</form>
			<%
				}else{
			%>	
					<p><%=num %></p>
					<p><%=name %></p>
					<p><%=email %></p>
					<input type="button" value="로그아웃" onclick="logout()">
			<%	
				}
			%>
			</div>
		</div>
		<script>
			function logout()
			{
				location.href="logout.jsp";
			}
		</script>
	</body>
</html>