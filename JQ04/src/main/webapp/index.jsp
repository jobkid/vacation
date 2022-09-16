<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>CSS변경 처리</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	</head>
	<body>
		<table>
			<thead>
				<tr>
					<th></th><th></th><th></th><th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td><td class="blue"></td><td><p></p></td><td></td>
				</tr>
				<tr id="second">
					<td></td><td class="blue"></td><td><p></p></td><td></td>
				</tr>
				<tr>
					<td></td><td class="blue"></td><td><p></p></td><td></td>
				</tr>
				<tr>
					<td></td><td class="blue"></td><td><p></p></td><td></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td></td><td></td><td></td><td></td>
				</tr>
			</tfoot>
		</table>
		<script>
			$(document).ready(function(){
				$("table").attr("style", "border : 3px solid black;");
				$("th, td").attr("style", "border:1px solid black; width:20px; height:20px;");
				$("#second").attr("style", "background-color:red;");
				$(".blue").attr("style", "background-color:blue;");
				$("td:first-child").attr("style", "background-color:green;");
				$("th + th").attr("style", "background-color:black;");
				$("td:has(p)").attr("style", "background-color:orange;");
			});
		</script>
	</body>
</html>