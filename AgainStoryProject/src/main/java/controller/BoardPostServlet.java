package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.StoryBean;
import DAO.StoryDAO;

/**
 * Servlet implementation class BoardPostServlet
 */
@WebServlet("/post.do")
public class BoardPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String nickname = request.getParameter("nick");
		String password = request.getParameter("pass");
		String title = request.getParameter("title");
		String writedate = request.getParameter("writedate");//매게 변수가 똑같아야 한다. sql필드명과...
		String content = request.getParameter("content");
		
		StoryBean sb = new StoryBean();
		
		sb.setNickname(nickname);
		sb.setPass(password);
		sb.setTitle(title);
		sb.setWritingdate(writedate);
		sb.setContent(content);
		
		StoryDAO sdao = StoryDAO.getInstance();
		int result = sdao.insertStory(sb);
		
		HttpSession session =request.getSession();
		if(result==1) {
			session.setAttribute("nickname", sb.getNickname());
			request.setAttribute("message","글쓰기를 마치셨습니다.");
			
		}else {
			request.setAttribute("message", "글쓰기에 실패했습니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher("checkWriting.jsp");
		dis.forward(request, response);
	}

}
