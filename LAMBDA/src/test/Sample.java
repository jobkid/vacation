package test;

public class Sample {
	public static void main(String[] args) {
		Out a=new Out();
		//inter i = new inter(); interface�� �����ڷ� ����� �� ����.
		//Data d = new Data();//���� ������ �ȴ�.
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
		/*���ٽ�*/
		/*�����ؾ� �ϴ� �߻� �޼����� ������ �� �ϳ��� ���� ��� ����*/
		a.method(()->{
			System.out.println("���ٽ����� ���� ����");
		});
	}

}
class Out{
	void method(inter i) {
		System.out.println("����Ȯ��");
		i.run();//�޼ҵ�� ���� ��ų �� ���� ���.
	}
}
interface inter{
	public void run();
}
class Data implements inter{
	public void run() {
		
	}
}