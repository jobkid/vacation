package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import beans.StoryBean;
import DAO.StoryDAO;
import java.util.ArrayList;

/**
 * Servlet implementation class ShowShortListServlet
 */
@WebServlet("/ShowShortList.do")
public class ShowShortListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int recordsPerPage = Integer.parseInt(request.getParameter("recordsPerPage"));
		int number = Integer.parseInt(request.getParameter("number"));
		
		StoryDAO sDAO = StoryDAO.getInstance();
		ArrayList<StoryBean> storyList = sDAO.getStoryList(currentPage, recordsPerPage);
		request.setAttribute("data", storyList);
		
		int row = sDAO.getNumberOfRows();
		int nOfPage = row/recordsPerPage;
		
		if(row%recordsPerPage>0) {
			nOfPage++;
		}
		
		request.setAttribute("nOfPage", nOfPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("recordsPerPage", recordsPerPage);
		
		RequestDispatcher dis = null; 
		
		if(number == 1) {
			dis = request.getRequestDispatcher("deleteShort2.jsp");
			System.out.println("deleteShort2.jsp으로 gogo");
		}else if(number == 0){
			dis = request.getRequestDispatcher("shortList.jsp");
			System.out.println("shortList.jsp으로 gogo");
		}else if(number == 2) {
			dis = request.getRequestDispatcher("updateShort2.jsp");
			System.out.println("updateShort2.jsp으로 gogo");
		}
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}

}