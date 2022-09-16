package SERVLET;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * Servlet implementation class RefreshList
 */
@WebServlet("/RefreshList")
public class RefreshList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static List<PetList> list = new ArrayList<PetList>();
	public void init() throws ServletException {
		System.out.println("init()����");
		list.add(new PetList("dog", "small", "��Ƽ��"));
		list.add(new PetList("dog", "small", "����"));
		list.add(new PetList("dog", "medium", "�׷����Ͽ��"));
		list.add(new PetList("dog", "medium", "��������"));
		list.add(new PetList("dog", "large", "��縮Ʈ����"));
		list.add(new PetList("dog", "large", "�����ݸ�"));
		list.add(new PetList("cat", "small", "�̰�Ǫ��"));
		list.add(new PetList("cat", "small", "��ġŲ"));
		list.add(new PetList("cat", "medium", "��Ű���Ӱ��"));
		list.add(new PetList("cat", "medium", "��Ű����"));
		list.add(new PetList("cat", "large", "������"));
		list.add(new PetList("cat", "large", "��"));
		list.add(new PetList("racoon", "small", "�����ʱ���"));
		list.add(new PetList("racoon", "small", "�ʱ���"));
		list.add(new PetList("racoon", "medium", "ū�ʱ���"));

	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("process() ����");
		response.setContentType("text/xml; charset=utf-8;");
		String race = request.getParameter("race");
		String size = request.getParameter("size");
		StringBuffer result = new StringBuffer("<pets>");
		for(PetList p:list) {
			if(p.getRace().equals(race)) {
				if(p.getSize().equals(size)) {
					result.append("<pet>");
					result.append(p.getName());
					result.append("</pet>");
				}
			}
		}
		result.append("<pets>");
		response.setContentType("text/xml");
		System.out.println(result);
		response.getWriter().write(result.toString());//���������� �ڹٴܿ��� �ڹٽ�ũ�������� �����ϱ� ������ ��Ʈ���� ����Ѵ�.
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
		/*
		System.out.println("doGet����Ȯ��");
		request.setCharacterEncoding("utf-8");
		String race = request.getParameter("race");
		String size = request.getParameter("size");
		System.out.println("���۹��� ������ Ȯ�� : "+race+", "+size);
		*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
