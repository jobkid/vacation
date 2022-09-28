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
		System.out.println("FirstShortList.do 실행실행");
		StoryDAO sDAO = StoryDAO.getInstance();// DAO패키지의 storyDAO.java 파일로 간다. 즉 싱글톤으로 객체를 만든다.
		ArrayList<StoryBean> storyList = sDAO.getStoryList(); //게시글 목록을 얻어온다.
		request.setAttribute("firstdata", storyList); //deleteShort.jsp와 firstshortList.jsp로 이따가 보낼 객체의 키와 값 설정
		
		int row = sDAO.getNumberOfRows();//DAO에서 게시글 전체 개수를 가져오는 메소드 select count(num) from shortboard;
		int nOfPage = row/recordsPerpage;//전체 게시글 개수에서 페이지당 게시글 개수를 나누면 페이지수가 나온다.. 페이지 개수는 멤버변수로 10을 정해놨음.
		
		if(row%recordsPerpage>0) {
			nOfPage++;// 전체 게시글 개수에서 페이지당 게시글 개수를 나눈 나머지가 0보다 크면 페이지수를 하나 늘린다. 
		}
		
		request.setAttribute("nOfPage", nOfPage);//deleteShort.jsp와 firstshortList.jsp에게 보낼 키와 값을 정리
		request.setAttribute("currentPage", 1);
		request.setAttribute("recordsPerPage", 10);
		request.setCharacterEncoding("utf-8");
		int number = Integer.parseInt(request.getParameter("number"));//index.jsp의 Again의 a태그에서 받아온 number값.
		RequestDispatcher dis=null;
		
		if(number==1) {//firtshortList.jsp에서 삭제버튼을 클릭하며 여기로 이동한다.
			dis = request.getRequestDispatcher("deleteShort.jsp");
			System.out.println("deleteShort.jsp doget 실행");
		}else if(number==0){
			System.out.println("===================");
			dis = request.getRequestDispatcher("firstshortList.jsp");//index.jsp의 Again a태그에서 처음에 0으로 설정했으므로 else if로 내려온다.
			System.out.println("firstshortList.jsp doget 실행");
		}else if(number==2) {//firstshortList.jsp에서 수정 버튼을 클릭하면 여기로 이동한다.
			dis = request.getRequestDispatcher("updateShort.jsp");
			System.out.println("updateShort.jsp로 이동");
		}
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//recordsPerpage = Integer.parseInt(request.getParameter("recordsPerPage"));
	}

}
