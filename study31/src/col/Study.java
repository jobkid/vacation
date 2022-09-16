package col;
import java.util.*;

public class Study {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//컬렉션
		//List(순서가 있으므로 중복 가능) : Vector, Stack, LinkedList(연결리스트 첫값, 끝값 나용하는데 유리), ArrayList(많이 씀)
		//Set (순서가 없으므로 중복 불가 순서가 없으면 구별할 수 없으므로 중복 값을 허용하지 않는다.):
		//ex) HashSet(많이 씀, 빠르다), SortedSet, TreeSet(요즘엔 부각)
		//Map (검색어(키), 값의 쌍 검색어 중복 되면 안됨.): HashMap, SortedMap, TreeMap

		//Vector : 가변 용량을 가진 저장단위
		//처은 제작 시 기본적으로 10개의 데이터를 저장할 수 있는 객체를 생성
		//10개가 넘어가는 순간 10개의 추가 공간을 생성
		//JAVA에서는 List인터페이스를 이용해서 구현한 클래스로 제작되어 있다.
		List L=new Vector();
		Vector V=new Vector();
		
		V.add(1);
		V.add(2);
		V.add(3);
		System.out.println(V.get(1));
		System.out.println(V.capacity());//현재 용량을 확인할 수 있다.
		System.out.println(V.size());//현재 데이터의 수를 확인할 수 있다.
		
		for(int i=0; i<9; i++)
		{
			V.add(i);
		}
		System.out.println(V.capacity());
		System.out.println(V.size());
		
		System.out.println("=============================");
		//Stack : 후입 선출을 진행하는 고전적인 데이터 처리 방식이다.
		//Java에서는 List인터페이스를 이용해서 구현한 클래스로 제작되어 있다.
		List L2=new Stack();
		Stack stk=new Stack();
		
		//puch() : 데이터를 입력
		//pop() : 데이터를 추출
		//peek() : 데이터를 확인
		
		stk.push("1");
		stk.push("2");
		stk.push("3");
		System.out.println(stk);
		
		System.out.println(stk);
		System.out.println(stk.pop());
		System.out.println(stk.peek());
		System.out.println(stk);
		System.out.println("=================================");
		//LinkedList : 데이터간 순번이 연결처리로 되어 있는 리스트
		//모든 동작은 ArrayList와 동일
		//어레이리스트와 다른 고유한 메서드가 존재
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