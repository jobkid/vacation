package controller;

import javax.servlet.*;
import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.StoryBean;
import DAO.StoryDAO;
import DAO.CommentDAO;
import beans.CommentBean;

/**
 * Servlet implementation class ReadContentServlet
 */
@WebServlet("/ReadContent.do")
public class ReadContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doget 작용");
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		StoryDAO sDAO = StoryDAO.getInstance();
		StoryBean sb = sDAO.getContent(num);
		request.setAttribute("sb", sb);
		
		//여기서부터 댓글
		int current = Integer.parseInt(request.getParameter("currentPage"));
		int records = Integer.parseInt(request.getParameter("recordsPerPage"));
		CommentDAO cDAO = CommentDAO.getInstance();
		int row = cDAO.getNumberOfRows();
		int nOfPage = row/records;
		if(row%records>0) {
			nOfPage++;
		}
		request.setAttribute("nOfPage", nOfPage);
		request.setAttribute("current", current);
		request.setAttribute("recordsPerPage", records);
		
		ArrayList<CommentBean> commentList = cDAO.readComment(num, current, records);	
		request.setAttribute("comment", commentList);
		
		RequestDispatcher dis = request.getRequestDispatcher("readShortContent.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
