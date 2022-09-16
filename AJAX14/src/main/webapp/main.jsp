<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Drag and Drop List</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<style>
			#wrap{
				border:5px solid red;
				width:200px;
				padding:30px;
				margin:0 auto;
			}
			ul{
				list-style:none;
				margin:0;
				padding:0;
				text-align:center;
			}
			li{
				border:1px solid black;
				margin:20px;
				padding:10px;
				width:150px;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<ul id="page_list">
				<c:forEach items="${data }" var="data">
					<li id="${data.idx }" value="${data.text }">${data.text} [${data.idx}]</li>
				</c:forEach>
			</ul>
		</div>
		<script>
			$(document).ready(function(){
				$("#page_list").sortable({
					update:function(event, ui){
						//console.log(event);	//이동의 원인
						//console.log(ui);	//움직인 요소
						var page_idx_arr=new Array();	//idx순서를 저장할 배열
						var page_text_arr=new Array();	//text순서를 저장할 배열
						$("#page_list li").each(function(){
							page_idx_arr.push($(this).attr("id"));
							page_text_arr.push($(this).attr("value"));
						});
						console.log(page_idx_arr);
						console.log(page_text_arr);
						var str_idx=JSON.stringify(page_idx_arr);
						var str_text=JSON.stringify(page_text_arr);
						$.ajax({
							url:"Srt",
							method:"POST",
							data:{
								"idx":str_idx,
								"text":str_text
							},
							async:true,
							success:function(){
								console.log("전송확인");
							}
						});
					}
				});
			});
		</script>
	</body>
</html>