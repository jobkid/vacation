package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import beans.CommentBean;
import beans.StoryBean;
import DAO.CommentDAO;
import DAO.StoryDAO;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/Comment.do")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("Comment.do의 dopost 실행");
		String nickname = request.getParameter("nickname");
		String comment = request.getParameter("comment");
		String title = request.getParameter("title");
		CommentBean cb = new CommentBean();
		cb.setNickname(nickname);
		cb.setComment(comment);
		cb.setTitle(title);
		CommentDAO commentdao = CommentDAO.getInstance();
		commentdao.insertComment(cb);
		
		int num = Integer.parseInt(request.getParameter("num"));
		StoryDAO sDAO = StoryDAO.getInstance();
		StoryBean sb = sDAO.getContent(num);
		
		request.setAttribute("sb", sb);
		request.setAttribute("comment", cb);
		RequestDispatcher dis = request.getRequestDispatcher("readShortContent.jsp");
		dis.forward(request, response);
		//response.sendRedirect("readShortContent.jsp");
		System.out.println("댓글입력 종료"+nickname+comment+title);
	}
}
