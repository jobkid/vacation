package beans;

public class Student {
	private String name;
	private int age;
	private String address;
	private int phone;
	public Student()
	{
		
	}
	public Student(String a, int b, String c, int d) {
		setName(a);
		setAge(b);
		setAddress(c);
		setPhone(d);
		
	}
	public void setPhone(int phone) {
		this.phone=phone;
	}
	
	public int getPhone() {
		return phone;
	}
	
	public void setStudent(String a, int b, String c) {
		this.name=a;
		this.age=b;
		this.address=c;
	}

	public void setName(String name) {
		this.name=name;
	}
	
	public String getName() {
		return name;
	}
	
	public void setAge(int age) {
		this.age=age;
	}
	public int getAge(){
		return age;
	}
	public void setAddress(String address) {
		this.address=address;
	}
	public String getAddress() {
		return address;
	}
}

/*
class Car{
	int number;
	private int gas;
	public void setGas(int a) {
		if(a<=0) {
			gas=0;
		}else {
			gas=a;
		}
	}
}

class Test{
	public static void main(String args){
		Car car=new Car();
		car.setGas(-100);
	}
}
*/