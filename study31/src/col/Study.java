package col;
import java.util.*;

public class Study {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//�÷���
		//List(������ �����Ƿ� �ߺ� ����) : Vector, Stack, LinkedList(���Ḯ��Ʈ ù��, ���� �����ϴµ� ����), ArrayList(���� ��)
		//Set (������ �����Ƿ� �ߺ� �Ұ� ������ ������ ������ �� �����Ƿ� �ߺ� ���� ������� �ʴ´�.):
		//ex) HashSet(���� ��, ������), SortedSet, TreeSet(���� �ΰ�)
		//Map (�˻���(Ű), ���� �� �˻��� �ߺ� �Ǹ� �ȵ�.): HashMap, SortedMap, TreeMap

		//Vector : ���� �뷮�� ���� �������
		//ó�� ���� �� �⺻������ 10���� �����͸� ������ �� �ִ� ��ü�� ����
		//10���� �Ѿ�� ���� 10���� �߰� ������ ����
		//JAVA������ List�������̽��� �̿��ؼ� ������ Ŭ������ ���۵Ǿ� �ִ�.
		List L=new Vector();
		Vector V=new Vector();
		
		V.add(1);
		V.add(2);
		V.add(3);
		System.out.println(V.get(1));
		System.out.println(V.capacity());//���� �뷮�� Ȯ���� �� �ִ�.
		System.out.println(V.size());//���� �������� ���� Ȯ���� �� �ִ�.
		
		for(int i=0; i<9; i++)
		{
			V.add(i);
		}
		System.out.println(V.capacity());
		System.out.println(V.size());
		
		System.out.println("=============================");
		//Stack : ���� ������ �����ϴ� �������� ������ ó�� ����̴�.
		//Java������ List�������̽��� �̿��ؼ� ������ Ŭ������ ���۵Ǿ� �ִ�.
		List L2=new Stack();
		Stack stk=new Stack();
		
		//puch() : �����͸� �Է�
		//pop() : �����͸� ����
		//peek() : �����͸� Ȯ��
		
		stk.push("1");
		stk.push("2");
		stk.push("3");
		System.out.println(stk);
		
		System.out.println(stk);
		System.out.println(stk.pop());
		System.out.println(stk.peek());
		System.out.println(stk);
		System.out.println("=================================");
		//LinkedList : �����Ͱ� ������ ����ó���� �Ǿ� �ִ� ����Ʈ
		//��� ������ ArrayList�� ����
		//��̸���Ʈ�� �ٸ� ������ �޼��尡 ����
		LinkedList<String> LL=new LinkedList<String>();
		LL.add("item1");
		LL.add("item2");
		LL.add("item3");
		LL.add("item4");
		LL.add("item5");
		System.out.println(LL);
		
		LL.addFirst("FIRST");
		LL.addLast("LAST");
		LL.removeFirst();
		LL.removeLast();
		System.out.println(LL);
	}
}