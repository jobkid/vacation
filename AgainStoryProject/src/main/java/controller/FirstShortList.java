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
		System.out.println("FirstShortList.do 실행실행");
		int recordsPerPage = Integer.parseInt(request.getParameter("recordsPerPage"));
		int current = Integer.parseInt(request.getParameter("currentPage"));
		int number = Integer.parseInt(request.getParameter("number"));//index.jsp의 Again의 a태그에서 받아온 number값.
		String category = request.getParameter("category");
		String search = request.getParameter("search");
		StoryDAO sDAO = StoryDAO.getInstance();// DAO패키지의 storyDAO.java 파일로 간다. 즉 싱글톤으로 객체를 만든다.
		ArrayList<StoryBean> storyList = null; //게시글 목록을 얻어온다.
		//deleteShort.jsp와 firstshortList.jsp로 이따가 보낼 객체의 키와 값 설정
		
		int row = sDAO.getNumberOfRows(category, search);//DAO에서 게시글 전체 개수를 가져오는 메소드 select count(num) from shortboard;
		int nOfPage = row/recordsPerPage;//전체 게시글 개수에서 페이지당 게시글 개수를 나누면 페이지수가 나온다.. 페이지 개수는 멤버변수로 10을 정해놨음.
		
		if(row%recordsPerPage>0) {
			nOfPage++;// 전체 게시글 개수에서 페이지당 게시글 개수를 나눈 나머지가 0보다 크면 페이지수를 하나 늘린다. 
		}
		
		request.setAttribute("nOfPage", nOfPage);//deleteShort.jsp와 firstshortList.jsp에게 보낼 키와 값을 정리
		request.setAttribute("currentPage", current);
		request.setAttribute("recordsPerPage", recordsPerPage);
		request.setCharacterEncoding("utf-8");
		
		RequestDispatcher dis=null;
		
		if(number==0&&category==null) {//firtshortList.jsp에서 삭제버튼을 클릭하며 여기로 이동한다.
			System.out.println("number가 "+number+"이고 category가 "+ category+" 일 때");
			storyList = sDAO.getStoryList(current, recordsPerPage);
			request.setAttribute("firstdata", storyList);
			request.setAttribute("number", number);
			request.setAttribute("category", category);
			request.setAttribute("search", search);
			dis = request.getRequestDispatcher("firstshortList.jsp");//index.jsp의 Again a태그에서 처음에 0으로 설정했으므로 else if로 내려온다.
			System.out.println("firstshortList.jsp doget 실행");
		}else if(number==0&&category!=null&&search=="") {
			System.out.println("두 번째 else if");
			System.out.println("number가 "+number+"이고 category가 null이 아님 : "+ category+", search가 "+search+" 일 때");
			storyList = sDAO.getStoryList(current, recordsPerPage);
			request.setAttribute("firstdata", storyList);
			request.setAttribute("number", number);
			request.setAttribute("category", category);
			request.setAttribute("search", search);
			dis = request.getRequestDispatcher("firstshortList.jsp");
		}else if(number==0&&category!=""&&search!=""){
			System.out.println("세 번째 else if");
			System.out.println("number가 "+number+"이고 category가 null이 아님 : "+ category+", search가 "+search+" 일 때");
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
			System.out.println("네 번째 else if"+number+", "+category);
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
