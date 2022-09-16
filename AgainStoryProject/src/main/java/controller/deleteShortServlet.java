package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.StoryDAO;

/**
 * Servlet implementation class deleteShortServlet
 */
@WebServlet("/deleteShort.do")
public class deleteShortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));		
		System.out.println("deleteShort.do¿« doGet Ω««‡"+num);
		StoryDAO SDao = StoryDAO.getInstance();
		SDao.deleteContent(num);
		response.sendRedirect("deleteComplete.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}