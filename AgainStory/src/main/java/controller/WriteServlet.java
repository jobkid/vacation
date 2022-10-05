package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.ShortStoryDAO;
import beans.DTOShortStory;


@WebServlet("/Write.do")
public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("/write.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content=request.getParameter("content");
		String nickname=request.getParameter("nickname");
		String password=request.getParameter("password");
		
		DTOShortStory ss = new DTOShortStory();
		ss.setTitle(title);
		ss.setContent(content);
		ss.setNickname(nickname);
		ss.setPassword(password);
		
		ShortStoryDAO sDao = ShortStoryDAO.getInstance();
		int result = sDao.insertStory(ss);
		
		HttpSession session = request.getSession();
		if(result==1) {
			
			session.setAttribute("nickname", ss.getNickname());
			request.setAttribute("message", "글쓰기에 성공했습니다.");
		}else{
			request.setAttribute("message", "글쓰기에 실패했습니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher("check2.jsp");
		dis.forward(request, response);
	}

}
