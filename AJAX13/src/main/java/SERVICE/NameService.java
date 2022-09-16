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
		System.out.println("�Է�Ȯ�� : "+prefix);
		String prefix_upper = prefix.toUpperCase();	//�Է¹��� ���ڸ� �빮�� ��ȯ
		List matches = new ArrayList();				//�˻������ ���� List
		Iterator itr = names.iterator();			//new iterator �Ⱦ���. .iterator����. �Է¹��� List�� �о��� iterator
		while(itr.hasNext()) {
			String name = (String)itr.next();		//�ش� ��ġ�� ���� ��ȯ�� �� �ڷ� ��ġ �̵�;
			String name_upper = name.toUpperCase();//����Ʈ ������ ���� �빮�ڷ� ��ȯ
			if(name_upper.startsWith(prefix_upper)) {
				//�빮�� ��ȯ�� ����Ʈ���� �ڷᰡ �Է¹��� ���ڸ� �빮�� ��ȯ�� ������ �����ϴ� ���
				//ù ���ڰ� �Է¹��� ���ڷ� �����ϴ� ���(��ҹ��� ������ �� �ʿ䰡 ����)
				matches.add(name);
			}
		}
		return matches;
	}
}
