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
		System.out.println("init()실행");
		list.add(new PetList("dog", "small", "말티즈"));
		list.add(new PetList("dog", "small", "시추"));
		list.add(new PetList("dog", "medium", "그레이하운드"));
		list.add(new PetList("dog", "medium", "보르조이"));
		list.add(new PetList("dog", "large", "골든리트리버"));
		list.add(new PetList("dog", "large", "보터콜리"));
		list.add(new PetList("cat", "small", "싱가푸라"));
		list.add(new PetList("cat", "small", "먼치킨"));
		list.add(new PetList("cat", "medium", "터키쉬앙고라"));
		list.add(new PetList("cat", "medium", "통키니즈"));
		list.add(new PetList("cat", "large", "메인쿤"));
		list.add(new PetList("cat", "large", "뱅갈"));
		list.add(new PetList("racoon", "small", "작은너구리"));
		list.add(new PetList("racoon", "small", "너구리"));
		list.add(new PetList("racoon", "medium", "큰너구리"));

	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("process() 실행");
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
		response.getWriter().write(result.toString());//주의할점은 자바단에서 자바스크립단으로 전송하기 때문에 스트링을 써야한다.
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
		/*
		System.out.println("doGet실행확인");
		request.setCharacterEncoding("utf-8");
		String race = request.getParameter("race");
		String size = request.getParameter("size");
		System.out.println("전송받은 데이터 확인 : "+race+", "+size);
		*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
