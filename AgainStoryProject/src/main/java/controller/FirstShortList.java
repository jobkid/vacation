package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.StoryDAO;
import beans.StoryBean;

@WebServlet("/FirstShortList.do")
public class FirstShortList extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doPost(request, response);
		System.out.println("FirstShortList.do �������");
		int recordsPerPage = Integer.parseInt(request.getParameter("recordsPerPage"));
		int current = Integer.parseInt(request.getParameter("currentPage"));
		int number = Integer.parseInt(request.getParameter("number"));//index.jsp�� Again�� a�±׿��� �޾ƿ� number��.
		String category = request.getParameter("category");
		String search = request.getParameter("search");
		StoryDAO sDAO = StoryDAO.getInstance();// DAO��Ű���� storyDAO.java ���Ϸ� ����. �� �̱������� ��ü�� �����.
		ArrayList<StoryBean> storyList = null; //�Խñ� ����� ���´�.
		//deleteShort.jsp�� firstshortList.jsp�� �̵��� ���� ��ü�� Ű�� �� ����
		
		int row = sDAO.getNumberOfRows(category, search);//DAO���� �Խñ� ��ü ������ �������� �޼ҵ� select count(num) from shortboard;
		int nOfPage = row/recordsPerPage;//��ü �Խñ� �������� �������� �Խñ� ������ ������ ���������� ���´�.. ������ ������ ��������� 10�� ���س���.
		
		if(row%recordsPerPage>0) {
			nOfPage++;// ��ü �Խñ� �������� �������� �Խñ� ������ ���� �������� 0���� ũ�� ���������� �ϳ� �ø���. 
		}
		
		request.setAttribute("nOfPage", nOfPage);//deleteShort.jsp�� firstshortList.jsp���� ���� Ű�� ���� ����
		request.setAttribute("currentPage", current);
		request.setAttribute("recordsPerPage", recordsPerPage);
		request.setCharacterEncoding("utf-8");
		
		RequestDispatcher dis=null;
		
		if(number==0&&category==null) {//firtshortList.jsp���� ������ư�� Ŭ���ϸ� ����� �̵��Ѵ�.
			System.out.println("number�� "+number+"�̰� category�� "+ category+" �� ��");
			storyList = sDAO.getStoryList(current, recordsPerPage);
			request.setAttribute("firstdata", storyList);
			request.setAttribute("number", number);
			request.setAttribute("category", category);
			request.setAttribute("search", search);
			dis = request.getRequestDispatcher("firstshortList.jsp");//index.jsp�� Again a�±׿��� ó���� 0���� ���������Ƿ� else if�� �����´�.
			System.out.println("firstshortList.jsp doget ����");
		}else if(number==0&&category!=null&&search=="") {
			System.out.println("�� ��° else if");
			System.out.println("number�� "+number+"�̰� category�� null�� �ƴ� : "+ category+", search�� "+search+" �� ��");
			storyList = sDAO.getStoryList(current, recordsPerPage);
			request.setAttribute("firstdata", storyList);
			request.setAttribute("number", number);
			request.setAttribute("category", category);
			request.setAttribute("search", search);
			dis = request.getRequestDispatcher("firstshortList.jsp");
		}else if(number==0&&category!=""&&search!=""){
			System.out.println("�� ��° else if");
			System.out.println("number�� "+number+"�̰� category�� null�� �ƴ� : "+ category+", search�� "+search+" �� ��");
			storyList = sDAO.getStoryList(current, recordsPerPage, category, search);
			request.setAttribute("firstdata", storyList);
			request.setAttribute("number", number);
			request.setAttribute("category", category);
			request.setAttribute("search", search);
			dis = request.getRequestDispatcher("firstshortList.jsp");
		}else if(number==1&&category==null){
			storyList = sDAO.getStoryList(current, recordsPerPage);
			request.setAttribute("firstdata", storyList);
			request.setAttribute("number", number);
			dis = request.getRequestDispatcher("firstshortList.jsp");
			System.out.println("�� ��° else if"+number+", "+category);
		}else if(number==2){
			storyList = sDAO.getStoryList(current, recordsPerPage);
			request.setAttribute("firstdata", storyList);
			request.setAttribute("number", number);
			dis = request.getRequestDispatcher("firstshortList.jsp");
		}
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//recordsPerpage = Integer.parseInt(request.getParameter("recordsPerPage"));
	}

}
