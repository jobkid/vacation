package test;

public class Sample {
	public static void main(String[] args) {
		Out a=new Out();
		//inter i = new inter(); interface는 생성자로 사용할 수 없다.
		//Data d = new Data();//다중 구현이 된다.
		/*
		inter dd = new Data();
		a.method(d);
		*/
		/*inter i=new inter(){
			public void run() {
				
			}
		};*/
		/*
		a.method(new inter() {
			public void run() {
				
			}
		});
		*/
		/*람다식*/
		/*구현해야 하는 추상 메서드의 갯수가 단 하나일 때만 사용 가능*/
		a.method(()->{
			System.out.println("람다식으로 동작 구현");
		});
	}

}
class Out{
	void method(inter i) {
		System.out.println("실행확인");
		i.run();//메소드명 통일 시킬 때 많이 사용.
	}
}
interface inter{
	public void run();
}
class Data implements inter{
	public void run() {
		
	}
}