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

/**
 * Servlet implementation class ReadContentServlet
 */
@WebServlet("/ReadContent.do")
public class ReadContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doget ÀÛ¿ë");
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		StoryDAO sDAO = StoryDAO.getInstance();
		StoryBean sb = sDAO.getContent(num);
		/*
		sb.getNum();
		sb.getNickname();
		sb.getWritingdate();
		sb.getContent();
		*/
		request.setAttribute("sb", sb);
		/*
		request.setAttribute("nickname", sb.getNickname());
		request.setAttribute("writing", sb.getWritingdate());
		request.setAttribute("content", sb.getContent());
		*/
		RequestDispatcher dis = request.getRequestDispatcher("readShortContent.jsp");
		//RequestDispatcher dis2 = request.getRequestDispatcher("shortList.jsp");
		dis.forward(request, response);
		//dis2.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
