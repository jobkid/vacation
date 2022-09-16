package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Beans.NoticeBean;
import DAO.NoticeDAO;
import javax.servlet.http.*;

/**
 * Servlet implementation class ContentServlet
 */
@WebServlet("/Content.do")
public class ContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("number"));
		
		NoticeDAO noticedao = NoticeDAO.getInstance();
		NoticeBean nb = noticedao.getPost(num);
		
		request.setAttribute("data", nb);
		
		//request.setAttribute("nickname", nb.getNickname());
		//request.setAttribute("title", nb.getTitle());
		//request.setAttribute("content", nb.getContent());
		//request.setAttribute("writing", nb.getWritingtime());
		
		
		//response.setContentType("text/html; charset=utf-8");
		//response.sendRedirect("readNotice.jsp");
		RequestDispatcher dis = request.getRequestDispatcher("readNotice.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}