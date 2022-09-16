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

/**
 * Servlet implementation class FirstShortList
 */
@WebServlet("/FirstShortList.do")
public class FirstShortList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    int recordsPerpage = 10;   
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doPost(request, response);
		StoryDAO sDAO = StoryDAO.getInstance();
		ArrayList<StoryBean> storyList = sDAO.getStoryList();
		
		request.setAttribute("firstdata", storyList);
		
		int row = sDAO.getNumberOfRows();
		int nOfPage = row/recordsPerpage;
		
		if(row%recordsPerpage>0) {
			nOfPage++;
		}
		
		request.setAttribute("nOfPage", nOfPage);
		request.setAttribute("currentPage", 1);
		request.setAttribute("recordsPerPage", 10);
		RequestDispatcher dis = request.getRequestDispatcher("firstshortList.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//recordsPerpage = Integer.parseInt(request.getParameter("recordsPerPage"));
	}

}
