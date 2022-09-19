package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.StoryDAO;
import beans.StoryBean;

/**
 * Servlet implementation class UpdateShort
 */
@WebServlet("/UpdateShort.do")
public class UpdateShort extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UpdateShort.do Ω««‡");
		int num = Integer.parseInt(request.getParameter("num"));
		StoryDAO sDAO = StoryDAO.getInstance();
		StoryBean sb = sDAO.getContent(num);
		
		System.out.println(sb.getPass());
		System.out.println(sb.getTitle());
		System.out.println(sb.getNickname());
		request.setAttribute("sb", sb);
		
		RequestDispatcher dis = request.getRequestDispatcher("rewriteshort.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UpdateShort.do¿« doPost");
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("password");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		StoryBean sb = new StoryBean();
		sb.setNum(num);
		sb.setContent(content);
		sb.setTitle(title);
		sb.setPass(password);
		
		StoryDAO sDAO = StoryDAO.getInstance();
		sDAO.updateContent(sb);
		
		System.out.println(sb.getContent());
		System.out.println(sb.getTitle());
		System.out.println(sb.getNickname());
		//request.setAttribute("sb", sb);
		
		RequestDispatcher dis = request.getRequestDispatcher("updateComplete.jsp");
		dis.forward(request, response);
		
	}

}
