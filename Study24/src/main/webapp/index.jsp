<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>EL �з�����</title>
	</head>
	<body>
		<div id="wrap">
			<form method="post" action="test.jsp">
				���̵� : <input type="text" name="user"><br>
				��й�ȣ : <input type="password" name="pw">
				<hr>
				�����ϴ� ����<br>
				<input type="checkbox" name="season" value="spring">��
				<input type="checkbox" name="season" value="summer">����
				<input type="checkbox" name="season" value="fall">����
				<input type="checkbox" name="season" value="winter">�ܿ�
				<br>
				<input type = "submit" value="�α���!">
			</form>
			<hr>
			<form method="post" action="add.jsp">
				<input type="text" name="first">+<input type="text" name="second"><br>
				<input type="submit" value="����ϱ�">
			</form>
		</div>
	</body>
</html>