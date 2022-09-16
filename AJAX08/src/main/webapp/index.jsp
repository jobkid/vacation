<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>JSON</title>
	</head>
	<body>
		<script>
			//JSON:JavaScript Object Notation
			//유사 Map 타입의 데이터를 담은 배열같은 형식
			//int arr={1,2,3,4,5};
			/*var student={"name":"이주협",
					"birthday":"1/15",
					"subject":"jsp",
					"address":"서울 광진구"
			};
			console.log(student);
			console.log(student.name);
			console.log(student.birthday);
			console.log(student.subject);
			console.log(student.address);*/
			
			//여기서부터 점심식사 이후에 수업 진행
			function Dog(race, name, year, color){
				this.race = race;
				this.name = name;
				this.year = year;
				this.color = color;
			}
			var obj = new Dog("말티즈", "똘이", "15", "흰색");//Dog라는 객체 존재.
			console.log(obj);
			console.log(obj.name);
			
			//JSoN을 String으로 변환
			var str_obj = JSON.stringify(obj);
			console.log(str_obj);
			console.log(str_obj.name);//undifine이 발생한 이유는 데이터 형태가 JSON이 아니라 String이라 발생하는 문제
			console.log(typeof(obj));
			console.log(typeof(str_obj));
			//JSON의 형태를 띄고 있는 String 데이터를 JSON Object로 변환
			var normal = JSON.parse(str_obj);
			console.log(normal);
			console.log(normal.name);
			
			var arr=[1, 5, 3, 34, 2, 52, 12];
			console.log(arr);
			console.log(arr[2]);
			var str_arr = JSON.stringify(arr);
			console.log(str_arr);
			console.log(str_arr[2]);
			var normal2 = JSON.parse(str_arr);
			console.log(normal2);
		</script>
	</body>
</html>