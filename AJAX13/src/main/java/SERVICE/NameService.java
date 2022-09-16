package SERVICE;

import java.util.*;

public class NameService {
	private List names;
	private NameService(List n) {
		names = n;
	}
	public static NameService getInstance(List n) {
		return new NameService(n);
	}
	public List findNames(String prefix) {
		System.out.println("입력확인 : "+prefix);
		String prefix_upper = prefix.toUpperCase();	//입력받은 문자를 대문자 변환
		List matches = new ArrayList();				//검색결과를 담을 List
		Iterator itr = names.iterator();			//new iterator 안쓴다. .iterator쓴다. 입력받은 List를 읽어줄 iterator
		while(itr.hasNext()) {
			String name = (String)itr.next();		//해당 위치의 값을 반환한 뒤 뒤로 위치 이동;
			String name_upper = name.toUpperCase();//리스트 내부의 값을 대문자로 변환
			if(name_upper.startsWith(prefix_upper)) {
				//대문자 변환한 리스트상의 자료가 입력받은 문자를 대문자 변환한 것으로 시작하는 경우
				//첫 문자가 입력받은 문자로 시작하는 경우(대소문자 구별을 할 필요가 없음)
				matches.add(name);
			}
		}
		return matches;
	}
}
