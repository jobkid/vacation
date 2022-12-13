package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.StoryDAO;
import beans.StoryBean;
import java.util.*;

@WebServlet("/MyBoard.do")
public class MyBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("내 글 확인하기");
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("nice");
		int niceid=id.hashCode();
		System.out.println(niceid);
		int current = Integer.parseInt(request.getParameter("current"));
		int record = Integer.parseInt(request.getParameter("record"));
		int number = Integer.parseInt(request.getParameter("number"));
		int number2 = Integer.parseInt(request.getParameter("number2"));
		StoryDAO sDAO = StoryDAO.getInstance();
		ArrayList<StoryBean> storyList = null;
		System.out.println(number+ " & "+number2);
		int row = sDAO.getNumberOfRows(id);
		int nOfPage = row/record;
		if(row%record>0) {
			nOfPage++;
		}
		
		
		//int num2=number2.hashCode();
		request.setAttribute("nOfPage", nOfPage);
		request.setAttribute("currentPage", current);
		request.setAttribute("recordsPerPage", record);
		storyList = sDAO.getStoryList(current, record, id);
		request.setAttribute("myBoard", storyList);
		RequestDispatcher dis=null;
		if(number==0&&number2==0) {
			System.out.println("처음 들어올 때");
			request.setAttribute("number", number);
			request.setAttribute("number2", number2);
			System.out.println(number+" & "+number2);
			dis = request.getRequestDispatcher("myBoard.jsp");
		}else if(number==niceid&&number2==0){
			System.out.println("삭제 버튼 클릭");
			request.setAttribute("number", number);
			request.setAttribute("number2", number2);
			System.out.println(number+" & "+number2);
			dis = request.getRequestDispatcher("myBoard.jsp");
		}else if(number==0&&number2==niceid) {
			System.out.println("수정 버튼 클릭");
			request.setAttribute("number", number);
			request.setAttribute("number2", number2);
			System.out.println(number+" & "+number2);
			dis = request.getRequestDispatcher("myBoard.jsp");
		}	
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
