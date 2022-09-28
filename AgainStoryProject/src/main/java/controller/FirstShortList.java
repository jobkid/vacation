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
    int recordsPerpage = 10;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doPost(request, response);
		System.out.println("FirstShortList.do �������");
		StoryDAO sDAO = StoryDAO.getInstance();// DAO��Ű���� storyDAO.java ���Ϸ� ����. �� �̱������� ��ü�� �����.
		ArrayList<StoryBean> storyList = sDAO.getStoryList(); //�Խñ� ����� ���´�.
		request.setAttribute("firstdata", storyList); //deleteShort.jsp�� firstshortList.jsp�� �̵��� ���� ��ü�� Ű�� �� ����
		
		int row = sDAO.getNumberOfRows();//DAO���� �Խñ� ��ü ������ �������� �޼ҵ� select count(num) from shortboard;
		int nOfPage = row/recordsPerpage;//��ü �Խñ� �������� �������� �Խñ� ������ ������ ���������� ���´�.. ������ ������ ��������� 10�� ���س���.
		
		if(row%recordsPerpage>0) {
			nOfPage++;// ��ü �Խñ� �������� �������� �Խñ� ������ ���� �������� 0���� ũ�� ���������� �ϳ� �ø���. 
		}
		
		request.setAttribute("nOfPage", nOfPage);//deleteShort.jsp�� firstshortList.jsp���� ���� Ű�� ���� ����
		request.setAttribute("currentPage", 1);
		request.setAttribute("recordsPerPage", 10);
		request.setCharacterEncoding("utf-8");
		int number = Integer.parseInt(request.getParameter("number"));//index.jsp�� Again�� a�±׿��� �޾ƿ� number��.
		RequestDispatcher dis=null;
		
		if(number==1) {//firtshortList.jsp���� ������ư�� Ŭ���ϸ� ����� �̵��Ѵ�.
			dis = request.getRequestDispatcher("deleteShort.jsp");
			System.out.println("deleteShort.jsp doget ����");
		}else if(number==0){
			System.out.println("===================");
			dis = request.getRequestDispatcher("firstshortList.jsp");//index.jsp�� Again a�±׿��� ó���� 0���� ���������Ƿ� else if�� �����´�.
			System.out.println("firstshortList.jsp doget ����");
		}else if(number==2) {//firstshortList.jsp���� ���� ��ư�� Ŭ���ϸ� ����� �̵��Ѵ�.
			dis = request.getRequestDispatcher("updateShort.jsp");
			System.out.println("updateShort.jsp�� �̵�");
		}
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//recordsPerpage = Integer.parseInt(request.getParameter("recordsPerPage"));
	}

}
